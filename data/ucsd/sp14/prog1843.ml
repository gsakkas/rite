
let rec wwhile (f,b) =
  match f b with | (bb,false ) -> bb | (bb,true ) -> wwhile (f, bb);;

let fixpoint (f,b) =
  wwhile (fun ff  -> fun b  -> (((f b), ((f b) != (f (b - 1)))), b));;
