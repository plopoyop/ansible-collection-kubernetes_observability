#!/usr/bin/env bash
# Print, as a JSON array, the roles to test for the changes between BASE and HEAD.
set -euo pipefail

shared='^(\.github/(workflows/test-roles?\.ya?ml|scripts/changed-roles\.sh)|devbox\.(json|lock)|devbox\.d/.+|flake\.(nix|lock)|Taskfile\.yml|requirements\.yml|\.pre-commit-config\.yaml)$'

base="${1:-}"
all_roles=$(find roles -mindepth 2 -maxdepth 2 -name molecule -type d | cut -d/ -f2 | sort)
if [ -z "$all_roles" ]; then
  echo "::error::No role with a molecule directory found" >&2
  exit 1
fi
fqcn=$(sed -n "s/^namespace: *[\"']\{0,1\}\([a-z0-9_]*\).*/\1/p" galaxy.yml).$(sed -n "s/^name: *[\"']\{0,1\}\([a-z0-9_]*\).*/\1/p" galaxy.yml)
if [[ ! $fqcn =~ ^[a-z0-9_]+\.[a-z0-9_]+$ ]]; then
  echo "::error::Cannot read the collection namespace and name from galaxy.yml" >&2
  exit 1
fi

# True when a molecule scenario of role $1 imports role $2: `name:` under
# import_role/include_role, or `role:` in a roles list.
imports() {
  local ref="[\"']?(${fqcn//./\\.}\\.)?$2[\"']?[[:space:]]*(#.*)?$"
  # Not grep -q: with pipefail, closing the pipe early can fail the first grep.
  grep -rhE -A6 '(import|include)_role:' "roles/$1/molecule" 2>/dev/null \
    | grep -E "^[[:space:]]*name:[[:space:]]*$ref" >/dev/null \
    || grep -rqE "^[[:space:]]*(-[[:space:]]+)?role:[[:space:]]*$ref" "roles/$1/molecule" 2>/dev/null
}

if [ -z "$base" ] || [ "$base" = "0000000000000000000000000000000000000000" ] \
  || ! git cat-file -e "${base}^{commit}" 2>/dev/null; then
  roles="$all_roles"
else
  # --no-renames: a file moved between roles changes both of them.
  # -z: paths are printed unquoted.
  changed=$(git diff -z --no-renames --name-only "$base" HEAD | tr '\0' '\n')
  if grep -qE "$shared" <<<"$changed"; then
    roles="$all_roles"
  else
    roles=$(comm -12 <(grep -E '^roles/[^/]+/' <<<"$changed" | cut -d/ -f2 | sort -u) \
      <(echo "$all_roles"))
    # Add the roles whose scenarios import a role to test, until none is added.
    previous=""
    while [ "$roles" != "$previous" ]; do
      previous="$roles"
      for role in $previous; do
        for other in $all_roles; do
          if imports "$other" "$role"; then
            roles+=$'\n'"$other"
          fi
        done
      done
      roles=$(sort -u <<<"$roles" | sed '/^$/d')
    done
  fi
fi

jq -cnR '[inputs | select(length > 0)]' <<<"$roles"
