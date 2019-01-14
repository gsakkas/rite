
let rec wwhile (f,b) =
  let pair = f b in
  let (b',c') = pair in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile (true, b);;


(* fix

let rec wwhile (f,b) =
  let pair = f b in
  let (b',c') = pair in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((fun x  -> ((f x), (x != (f x)))), b);;

*)

(* changed spans
(6,29)-(6,33)
fun x -> (f x , x <> f x)
LamG (TupleG (fromList [EmptyG]))

(6,35)-(6,36)
f
VarG

(6,35)-(6,36)
x
VarG

(6,35)-(6,36)
x
VarG

(6,35)-(6,36)
f
VarG

(6,35)-(6,36)
x
VarG

(6,35)-(6,36)
f x
AppG (fromList [VarG])

(6,35)-(6,36)
f x
AppG (fromList [VarG])

(6,35)-(6,36)
x <> f x
BopG VarG (AppG (fromList [EmptyG]))

(6,35)-(6,36)
(f x , x <> f x)
TupleG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)
