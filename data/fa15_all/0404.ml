
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let fx x = x in wwhile ((fx b), b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(6,21)-(6,55)
fun b ->
  if f b
  then (b , true)
  else (b , false)
LamG (IteG EmptyG EmptyG EmptyG)

(6,21)-(6,55)
if f b
then (b , true)
else (b , false)
IteG (AppG (fromList [EmptyG])) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(6,32)-(6,33)
b
VarG

(6,32)-(6,33)
let funt =
  fun b ->
    if f b
    then (b , true)
    else (b , false) in
wwhile (funt , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(6,37)-(6,43)
f
VarG

(6,45)-(6,51)
true
LitG

(6,45)-(6,51)
(b , false)
TupleG (fromList [VarG,LitG])

(6,46)-(6,48)
wwhile
VarG

(6,46)-(6,48)
funt
VarG

(6,46)-(6,48)
b
VarG

(6,46)-(6,48)
wwhile (funt , b)
AppG (fromList [TupleG (fromList [EmptyG])])

(6,46)-(6,48)
false
LitG

(6,46)-(6,48)
(funt , b)
TupleG (fromList [VarG])

*)
