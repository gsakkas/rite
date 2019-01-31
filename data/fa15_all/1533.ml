
let f' (f,b) = (f b) = b;;

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) = wwhile ((f' (f, b)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' b = if (f b) = b then (b, true) else ((f b), false) in f'), b);;

*)

(* changed spans
(7,29)-(7,40)
fun b ->
  if f b = b
  then (b , true)
  else (f b , false)
LamG (IteG EmptyG EmptyG EmptyG)

(7,29)-(7,40)
f b = b
BopG (AppG (fromList [EmptyG])) VarG

(7,29)-(7,40)
let f' =
  fun b ->
    if f b = b
    then (b , true)
    else (f b , false) in
f'
LetG NonRec (fromList [LamG EmptyG]) VarG

(7,29)-(7,40)
if f b = b
then (b , true)
else (f b , false)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(7,30)-(7,32)
f
VarG

(7,33)-(7,39)
b
VarG

(7,33)-(7,39)
b
VarG

(7,34)-(7,35)
b
VarG

(7,34)-(7,35)
f b
AppG (fromList [VarG])

(7,34)-(7,35)
true
LitG

(7,34)-(7,35)
(f b , false)
TupleG (fromList [AppG (fromList [EmptyG]),LitG])

(7,42)-(7,43)
f'
VarG

(7,42)-(7,43)
false
LitG

*)
