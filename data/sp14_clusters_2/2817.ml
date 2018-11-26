
let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile ((f ((f b) = b)), b);;


(* fix

let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile ((fun b  -> ((f b), ((f b) = b))), b);;

*)

(* changed spans
(6,29)-(6,44)
fun b -> (f b , f b = b)
LamG (TupleG (fromList [EmptyG]))

(6,29)-(6,44)
(f b , f b = b)
TupleG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

(6,32)-(6,43)
b
VarG

*)
