
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let funt b = (f, ((f b) = b)) in wwhile (funt, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(6,38)-(6,49)
if f b
then (b , true)
else (b , false)
IteG (AppG (fromList [EmptyG])) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(6,39)-(6,44)
(b , true)
TupleG (fromList [VarG,LitG])

(6,40)-(6,41)
b
VarG

(6,40)-(6,41)
true
LitG

(6,40)-(6,41)
false
LitG

(6,40)-(6,41)
(b , false)
TupleG (fromList [VarG,LitG])

*)
