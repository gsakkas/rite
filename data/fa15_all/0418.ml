
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let funt b = if f b then 0 else 1 in wwhile (funt, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(6,39)-(6,40)
b
VarG

(6,39)-(6,40)
b
VarG

(6,39)-(6,40)
true
LitG

(6,39)-(6,40)
false
LitG

(6,39)-(6,40)
(b , false)
TupleG (fromList [VarG,LitG])

(6,53)-(6,54)
(b , true)
TupleG (fromList [VarG,LitG])

*)
