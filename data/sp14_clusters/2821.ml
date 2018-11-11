
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
(6,29)-(6,57)
b
VarG

(6,32)-(6,37)
fun b -> (f b , f b = b)
LamG (TupleG [EmptyG,EmptyG])

(6,32)-(6,37)
(f b , f b = b)
TupleG [AppG [EmptyG],BopG EmptyG EmptyG]

(6,32)-(6,41)
(fun b -> (f b , f b = b) , b)
TupleG [LamG EmptyG,VarG]

(6,47)-(6,57)
f b = b
BopG (AppG [EmptyG]) VarG

*)
