
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let funt = (f, ((f b) = b)) in wwhile (b, funt);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(6,32)-(6,48)
if f b
then (b , true)
else (b , false)
IteG (AppG (fromList [EmptyG])) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(6,36)-(6,47)
fun b ->
  if f b
  then (b , true)
  else (b , false)
LamG (IteG EmptyG EmptyG EmptyG)

(6,37)-(6,42)
(b , true)
TupleG (fromList [VarG,LitG])

(6,38)-(6,39)
b
VarG

(6,38)-(6,39)
true
LitG

(6,38)-(6,39)
false
LitG

(6,38)-(6,39)
(b , false)
TupleG (fromList [VarG,LitG])

(6,59)-(6,68)
b
VarG

*)
