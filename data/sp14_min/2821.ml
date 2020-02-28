
let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile (if (f b) = b then ((f b), b));;


(* fix

let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile ((fun b  -> ((f b), ((f b) = b))), b);;

*)

(* changed spans
(6,29)-(6,59)
(fun b -> (f b , f b = b) , b)
TupleG [LamG EmptyPatG EmptyG,VarG]

*)

(* type error slice
(6,29)-(6,59)
(6,48)-(6,58)
(6,58)-(6,58)
*)
