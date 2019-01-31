
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
(6,20)-(6,59)
fun input ->
  (f input , f input = b)
LamG (TupleG (fromList [EmptyG]))

(6,33)-(6,39)
input
VarG

(6,46)-(6,52)
input
VarG

*)
