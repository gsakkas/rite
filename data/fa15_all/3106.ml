
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((not f), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper b = if (f b) = b then (b, false) else ((f b), true) in
  wwhile (helper, b);;

*)

(* changed spans
(4,21)-(4,27)
f
VarG

(4,21)-(4,40)
fun b ->
  if f b = b
  then (b , false)
  else (f b , true)
LamG (IteG EmptyG EmptyG EmptyG)

(4,21)-(4,40)
f b = b
BopG (AppG (fromList [EmptyG])) VarG

(4,21)-(4,40)
let helper =
  fun b ->
    if f b = b
    then (b , false)
    else (f b , true) in
wwhile (helper , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(4,21)-(4,40)
if f b = b
then (b , false)
else (f b , true)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(4,28)-(4,40)
b
VarG

(4,28)-(4,40)
b
VarG

(4,29)-(4,36)
b
VarG

(4,29)-(4,36)
false
LitG

(4,29)-(4,36)
(f b , true)
TupleG (fromList [AppG (fromList [EmptyG]),LitG])

*)
