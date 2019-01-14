
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt = let res = f b in match b with | res -> b in wwhile (funt, f);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(6,14)-(7,73)
if f b
then (b , true)
else (b , false)
IteG (AppG (fromList [EmptyG])) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(7,13)-(7,53)
fun b ->
  if f b
  then (b , true)
  else (b , false)
LamG (IteG EmptyG EmptyG EmptyG)

(7,25)-(7,26)
true
LitG

(7,25)-(7,26)
(b , false)
TupleG (fromList [VarG,LitG])

(7,30)-(7,53)
false
LitG

(7,30)-(7,53)
(b , true)
TupleG (fromList [VarG,LitG])

(7,71)-(7,72)
b
VarG

*)
