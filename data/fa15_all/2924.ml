
let rec wwhile (f,b) =
  let pair = f b in
  let (b',c') = pair in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile (f, true, b);;


(* fix

let rec wwhile (f,b) =
  let pair = f b in
  let (b',c') = pair in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((fun x  -> ((f x), (x != (f x)))), b);;

*)

(* changed spans
(6,28)-(6,40)
(fun x ->
   (f x , x <> f x) , b)
TupleG (fromList [VarG,LamG EmptyG])

(6,29)-(6,30)
fun x -> (f x , x <> f x)
LamG (TupleG (fromList [EmptyG]))

(6,29)-(6,30)
f x
AppG (fromList [VarG])

(6,29)-(6,30)
(f x , x <> f x)
TupleG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

(6,32)-(6,36)
x
VarG

(6,38)-(6,39)
x
VarG

(6,38)-(6,39)
f
VarG

(6,38)-(6,39)
x
VarG

(6,38)-(6,39)
f x
AppG (fromList [VarG])

(6,38)-(6,39)
x <> f x
BopG VarG (AppG (fromList [EmptyG]))

*)
