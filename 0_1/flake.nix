{
  description = ''A library to automatically encrypt all string constants in your programs'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-strenc-0_1.flake = false;
  inputs.src-strenc-0_1.owner = "Yardanico";
  inputs.src-strenc-0_1.ref   = "0_1";
  inputs.src-strenc-0_1.repo  = "nim-strenc";
  inputs.src-strenc-0_1.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-strenc-0_1"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-strenc-0_1";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}