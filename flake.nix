{
  description = "scripts for doing things with git";
  inputs.nixpkgs = { type = "indirect"; id = "nixpkgs"; };
  outputs = { self, nixpkgs }: {
    packages = builtins.mapAttrs (import ./packages.nix) nixpkgs.outputs.legacyPackages;
  };
}
