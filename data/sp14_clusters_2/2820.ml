
let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile (if (f b) = b then (f, b));;


(* fix

let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile ((fun b  -> ((f b), ((f b) = b))), b);;

*)

(* changed spans
(6,28)-(6,54)
(fun b -> (f b , f b = b) , b)
TupleG (fromList [VarG,LamG EmptyG])

(6,32)-(6,41)
f
VarG

(6,32)-(6,41)
b
VarG

(6,32)-(6,41)
fun b -> (f b , f b = b)
LamG (TupleG (fromList [EmptyG]))

(6,32)-(6,41)
f b
AppG (fromList [VarG])

(6,32)-(6,41)
(f b , f b = b)
TupleG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)
