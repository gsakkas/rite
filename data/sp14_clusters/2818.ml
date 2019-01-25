
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
(6,28)-(6,47)
(fun b -> (f b , f b = b) , b)
TupleG [LamG EmptyG,VarG]

(6,29)-(6,30)
fun b -> (f b , f b = b)
LamG (TupleG [EmptyG,EmptyG])

(6,29)-(6,30)
f b
AppG [VarG]

(6,29)-(6,30)
(f b , f b = b)
TupleG [AppG [EmptyG],BopG EmptyG EmptyG]

(6,32)-(6,43)
b
VarG

*)