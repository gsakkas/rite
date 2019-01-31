
let rec wwhile (f,b) =
  let pair = f b in
  let (b',c') = pair in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((f, (b != (f b))), b);;


(* fix

let rec wwhile (f,b) =
  let pair = f b in
  let (b',c') = pair in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((fun x  -> ((f x), (x != (f x)))), b);;

*)

(* changed spans
(6,29)-(6,46)
fun x -> (f x , x <> f x)
LamG (TupleG (fromList [EmptyG]))

(6,30)-(6,31)
f x
AppG (fromList [VarG])

(6,33)-(6,45)
x
VarG

(6,34)-(6,35)
x
VarG

(6,42)-(6,43)
x
VarG

*)
