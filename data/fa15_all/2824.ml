
let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile (((f b), b), b);;


(* fix

let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile ((fun b  -> ((f b), ((f b) = b))), b);;

*)

(* changed spans
(6,29)-(6,39)
fun b -> (f b , f b = b)
LamG (TupleG (fromList [EmptyG]))

(6,37)-(6,38)
f
VarG

(6,37)-(6,38)
f b
AppG (fromList [VarG])

(6,37)-(6,38)
f b = b
BopG (AppG (fromList [EmptyG])) VarG

*)
