
let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile ((f f b), b);;


(* fix

let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile ((fun b  -> ((f b), ((f b) = b))), b);;

*)

(* changed spans
(6,29)-(6,36)
fun b -> (f b , f b = b)
LamG (TupleG [EmptyG,EmptyG])

(6,30)-(6,31)
f b
AppG [VarG]

(6,30)-(6,31)
(f b , f b = b)
TupleG [AppG [EmptyG],BopG EmptyG EmptyG]

(6,32)-(6,33)
b
VarG

(6,32)-(6,33)
f b
AppG [VarG]

(6,32)-(6,33)
f b = b
BopG (AppG [EmptyG]) VarG

*)
