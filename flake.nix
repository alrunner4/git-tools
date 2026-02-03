{
  description = "scripts for doing things with git";
  inputs.nixpkgs = { type = "indirect"; id = "nixpkgs"; };
  outputs = { self, nixpkgs }: {
    packages = builtins.mapAttrs (system: pkgs: rec {
      scripts = pkgs.symlinkJoin {
        paths = [ ./scripts ];
        name = "git-tools";
      };
      default = scripts;
    }) nixpkgs.outputs.legacyPackages;
  };
}
