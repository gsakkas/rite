
let rec wwhile (f,b) =
  let pair = f b in
  let (b',c') = pair in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile (f, (b, (b != (f b))));;


(* fix

let rec wwhile (f,b) =
  let pair = f b in
  let (b',c') = pair in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((fun x  -> ((f x), (x != (f x)))), b);;

*)

(* changed spans
(6,29)-(6,30)
fun x -> (f x , x <> f x)
LamG (TupleG (fromList [EmptyG]))

(6,33)-(6,34)
f x
AppG (fromList [VarG])

(6,36)-(6,48)
f
VarG

(6,36)-(6,48)
x
VarG

(6,37)-(6,38)
x
VarG

(6,45)-(6,46)
x
VarG

*)
