
let rec wwhile (f,b) =
  let pair = f b in
  let (b',c') = pair in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((f, true), b);;


(* fix

let rec wwhile (f,b) =
  let pair = f b in
  let (b',c') = pair in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((fun x  -> ((f x), (x != (f x)))), b);;

*)

(* changed spans
(6,29)-(6,38)
fun x -> (f x , x <> f x)
LamG (TupleG (fromList [EmptyG]))

(6,30)-(6,31)
f x
AppG (fromList [VarG])

(6,33)-(6,37)
x
VarG

(6,40)-(6,41)
x
VarG

(6,40)-(6,41)
f
VarG

(6,40)-(6,41)
x
VarG

(6,40)-(6,41)
f x
AppG (fromList [VarG])

(6,40)-(6,41)
x <> f x
BopG VarG (AppG (fromList [EmptyG]))

*)
