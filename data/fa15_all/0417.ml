
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = wwhile ((f, (f b)), b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(4,53)-(4,54)
fun b ->
  if f b
  then (b , true)
  else (b , false)
LamG (IteG EmptyG EmptyG EmptyG)

(4,53)-(4,54)
let funt =
  fun b ->
    if f b
    then (b , true)
    else (b , false) in
wwhile (funt , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(4,53)-(4,54)
if f b
then (b , true)
else (b , false)
IteG (AppG (fromList [EmptyG])) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(6,14)-(6,43)
b
VarG

(6,21)-(6,27)
f
VarG

(6,21)-(6,43)
b
VarG

(6,21)-(6,43)
true
LitG

(6,33)-(6,38)
wwhile
VarG

(6,33)-(6,38)
funt
VarG

(6,33)-(6,38)
wwhile (funt , b)
AppG (fromList [TupleG (fromList [EmptyG])])

(6,33)-(6,38)
false
LitG

(6,33)-(6,38)
(funt , b)
TupleG (fromList [VarG])

*)
