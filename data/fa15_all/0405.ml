
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let fx x = x in wwhile (2, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(6,21)-(6,50)
fun b ->
  if f b
  then (b , true)
  else (b , false)
LamG (IteG EmptyG EmptyG EmptyG)

(6,21)-(6,50)
if f b
then (b , true)
else (b , false)
IteG (AppG (fromList [EmptyG])) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(6,28)-(6,33)
f
VarG

(6,28)-(6,33)
b
VarG

(6,28)-(6,33)
b
VarG

(6,28)-(6,33)
b
VarG

(6,28)-(6,33)
wwhile (funt , b)
AppG (fromList [TupleG (fromList [EmptyG])])

(6,28)-(6,33)
true
LitG

(6,28)-(6,33)
false
LitG

(6,28)-(6,33)
(b , true)
TupleG (fromList [VarG,LitG])

(6,28)-(6,33)
(b , false)
TupleG (fromList [VarG,LitG])

(6,32)-(6,33)
let funt =
  fun b ->
    if f b
    then (b , true)
    else (b , false) in
wwhile (funt , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(6,45)-(6,46)
funt
VarG

*)
