
let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile ((f, ((f b) = b)), b);;


(* fix

let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile ((fun b  -> ((f b), ((f b) = b))), b);;

*)

(* changed spans
(6,30)-(6,46)
fun b -> (f b , f b = b)
LamG VarPatG (TupleG [EmptyG,EmptyG])

*)

(* type error slice
(2,4)-(4,17)
(2,17)-(4,15)
(4,10)-(4,15)
(4,11)-(4,12)
(6,22)-(6,28)
(6,22)-(6,50)
(6,29)-(6,50)
(6,30)-(6,46)
*)
