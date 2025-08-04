{ pkgs, lib, config, inputs, ... }:

{
  env.LOCALE_ARCHIVE="${pkgs.glibcLocales}/lib/locale/locale-archive";
  env.LANG="en_US.UTF8";

  packages = [
    pkgs.ansible
    pkgs.ansible-doctor
    pkgs.ansible-lint
    pkgs.git
    pkgs.glibcLocales
    pkgs.go-task
    pkgs.kind
    pkgs.kubernetes-helm
    pkgs.pre-commit
    pkgs.python312Packages.kubernetes
    pkgs.python312Packages.molecule
    pkgs.python312Packages.molecule-plugins
    pkgs.yamllint
 ];

  languages.ansible.enable = true;

  enterShell = ''
    export ANSIBLE_ROLES_PATH=$PWD/.devenv/ansible/roles;
    export ANSIBLE_COLLECTIONS_PATH=$PWD/.devenv/ansible/collections;

    mkdir -p $ANSIBLE_ROLES_PATH
    mkdir -p $ANSIBLE_COLLECTIONS_PATH

    export ANSIBLE_ROLES_PATH=$ANSIBLE_ROLES_PATH:$PWD/roles

    echo $GITHUB_WORKSPACE
    if [ -n "$GITHUB_WORKSPACE" ]; then
      export ANSIBLE_ROLES_PATH=$ANSIBLE_ROLES_PATH:$GITHUB_WORKSPACE/roles
    fi
  '';
}
