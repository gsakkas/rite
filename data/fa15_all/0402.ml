
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let fx = 2 in wwhile (fx, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(6,14)-(6,49)
fun b ->
  if f b
  then (b , true)
  else (b , false)
LamG (IteG EmptyG EmptyG EmptyG)

(6,14)-(6,49)
if f b
then (b , true)
else (b , false)
IteG (AppG (fromList [EmptyG])) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(6,21)-(6,49)
f
VarG

(6,21)-(6,49)
b
VarG

(6,21)-(6,49)
b
VarG

(6,21)-(6,49)
b
VarG

(6,21)-(6,49)
wwhile (funt , b)
AppG (fromList [TupleG (fromList [EmptyG])])

(6,21)-(6,49)
true
LitG

(6,21)-(6,49)
false
LitG

(6,21)-(6,49)
(b , true)
TupleG (fromList [VarG,LitG])

(6,21)-(6,49)
(b , false)
TupleG (fromList [VarG,LitG])

(6,30)-(6,31)
let funt =
  fun b ->
    if f b
    then (b , true)
    else (b , false) in
wwhile (funt , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(6,43)-(6,45)
funt
VarG

*)
