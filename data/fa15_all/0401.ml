
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let fx a = true in wwhile (fx, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(6,14)-(6,54)
f
VarG

(6,14)-(6,54)
b
VarG

(6,14)-(6,54)
b
VarG

(6,14)-(6,54)
fun b ->
  if f b
  then (b , true)
  else (b , false)
LamG (IteG EmptyG EmptyG EmptyG)

(6,14)-(6,54)
f b
AppG (fromList [VarG])

(6,14)-(6,54)
if f b
then (b , true)
else (b , false)
IteG (AppG (fromList [EmptyG])) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(6,14)-(6,54)
(b , true)
TupleG (fromList [VarG,LitG])

(6,21)-(6,54)
b
VarG

(6,21)-(6,54)
false
LitG

(6,21)-(6,54)
(b , false)
TupleG (fromList [VarG,LitG])

(6,28)-(6,36)
let funt =
  fun b ->
    if f b
    then (b , true)
    else (b , false) in
wwhile (funt , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(6,48)-(6,50)
funt
VarG

*)
