
let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile (f, (f b));;


(* fix

let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile ((fun b  -> ((f b), ((f b) = b))), b);;

*)

(* changed spans
(6,30)-(6,31)
fun b -> (f b , f b = b)
LamG VarPatG (TupleG [EmptyG,EmptyG])

(6,33)-(6,38)
b
VarG

*)

(* type error slice
(2,4)-(4,17)
(2,17)-(4,15)
(3,3)-(4,15)
(3,19)-(3,67)
(3,53)-(3,59)
(3,54)-(3,55)
(3,56)-(3,58)
(4,3)-(4,9)
(4,3)-(4,15)
(4,10)-(4,15)
(4,11)-(4,12)
(4,13)-(4,14)
(6,22)-(6,28)
(6,22)-(6,39)
(6,29)-(6,39)
(6,30)-(6,31)
(6,33)-(6,38)
(6,34)-(6,35)
*)
