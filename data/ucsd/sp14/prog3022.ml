
let rec wwhile (f,b) =
  match f b with | (bb,false ) -> bb | (bb,true ) -> wwhile (f, bb);;

let fixpoint (f,b) =
  wwhile ((fun b  -> ((f b), (((f b) != b) || ((f b) != (f (f b)))))), b);;

let _ = fixpoint (exp, 0);;
