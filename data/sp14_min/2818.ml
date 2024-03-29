
let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile (f, ((f b) = b), b);;


(* fix

let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile ((fun b  -> ((f b), ((f b) = b))), b);;

*)

(* changed spans
(6,29)-(6,48)
(fun b -> (f b , f b = b) , b)
TupleG [LamG EmptyPatG EmptyG,VarG]

*)

(* type error slice
(2,4)-(4,17)
(2,17)-(4,15)
(6,22)-(6,28)
(6,22)-(6,48)
(6,29)-(6,48)
*)
