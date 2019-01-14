
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let res = f b in
  if b = 0 then 0 else if b > 1 then b - 1 else b + (1 wwhile (f, res));;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(4,67)-(4,68)
fun b ->
  if f b
  then (b , true)
  else (b , false)
LamG (IteG EmptyG EmptyG EmptyG)

(4,67)-(4,68)
if f b
then (b , true)
else (b , false)
IteG (AppG (fromList [EmptyG])) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(7,2)-(8,71)
let funt =
  fun b ->
    if f b
    then (b , true)
    else (b , false) in
wwhile (funt , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(8,37)-(8,38)
(b , false)
TupleG (fromList [VarG,LitG])

(8,37)-(8,42)
(b , true)
TupleG (fromList [VarG,LitG])

(8,48)-(8,49)
wwhile (funt , b)
AppG (fromList [TupleG (fromList [EmptyG])])

(8,48)-(8,71)
true
LitG

(8,53)-(8,54)
false
LitG

(8,62)-(8,70)
b
VarG

(8,66)-(8,69)
funt
VarG

*)
