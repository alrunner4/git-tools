system: pkgs: rec
{
  scripts = pkgs.symlinkJoin {
    paths = [ ./scripts ];
    name = "git-tools";
  };
  default = scripts;
}
