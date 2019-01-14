
let rec wwhile (f,b) =
  let pair = f b in
  let (b',c') = pair in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((f, (f == b)), b);;


(* fix

let rec wwhile (f,b) =
  let pair = f b in
  let (b',c') = pair in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((fun x  -> ((f x), (x != (f x)))), b);;

*)

(* changed spans
(6,29)-(6,42)
fun x -> (f x , x <> f x)
LamG (TupleG (fromList [EmptyG]))

(6,30)-(6,31)
f x
AppG (fromList [VarG])

(6,33)-(6,41)
x
VarG

(6,34)-(6,35)
x
VarG

(6,34)-(6,35)
f x
AppG (fromList [VarG])

(6,34)-(6,35)
x <> f x
BopG VarG (AppG (fromList [EmptyG]))

(6,39)-(6,40)
x
VarG

*)
