system: pkgs: let

dependencies = [
    pkgs.coreutils
    pkgs.exiftool
];

tools-interpreter = pkgs.writeShellScript "git-tools-interpreter" ''
    export PATH=${builtins.concatStringsSep ":" (builtins.map (dep: "${dep}/bin") dependencies) }
    exec $(${pkgs.coreutils}/bin/readlink /proc/$$/exe) "$@"
    '';

patchshebangs = import (builtins.fetchGit {
    url = "git@github.com:alrunner4/patchshebangs";
    ref = "main";
}) { inherit pkgs; };

in rec
{
  scripts = derivation {
    inherit system;
    name = "git-tools";
    builder = pkgs.writeShellScript "build-git-tools" ''
        ${pkgs.coreutils}/bin/cp -r ${./scripts} $out
        ${pkgs.coreutils}/bin/chmod -R +w $out
        ${patchshebangs.batch}/bin/patchshebangs $out <<REWRITES
        /usr/bin/bash ${tools-interpreter}
        REWRITES
        ${pkgs.coreutils}/bin/chmod -R +x $out/bin
        '';
    };
  default = scripts;
}
