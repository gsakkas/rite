
let rec wwhile (f,b) =
  let (value,result) = f b in if not result then value else wwhile (f, value);;

let fixpoint (f,b) =
  wwhile ((let func output = ((f output), ((f output) = b)) in func b), b);;


(* fix

let rec wwhile (f,b) =
  let (value,result) = f b in if not result then value else wwhile (f, value);;

let fixpoint (f,b) =
  wwhile ((let func input = ((f input), ((f input) = b)) in func), b);;

*)

(* changed spans
(6,21)-(6,60)
fun input ->
  (f input , f input = b)
LamG VarPatG (TupleG [EmptyG,EmptyG])

(6,64)-(6,70)
func
VarG

*)

(* type error slice
(3,24)-(3,25)
(3,24)-(3,27)
(3,61)-(3,67)
(3,61)-(3,78)
(3,68)-(3,78)
(3,69)-(3,70)
(6,3)-(6,9)
(6,3)-(6,75)
(6,10)-(6,75)
(6,11)-(6,71)
(6,21)-(6,60)
(6,30)-(6,60)
(6,64)-(6,68)
(6,64)-(6,70)
*)
