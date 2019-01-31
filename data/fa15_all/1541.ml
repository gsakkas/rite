
let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) = wwhile ((let f' b = (f b) = b in f'), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' b = if (f b) = b then (b, true) else ((f b), false) in f'), b);;

*)

(* changed spans
(5,41)-(5,50)
if f b = b
then (b , true)
else (f b , false)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(5,54)-(5,56)
b
VarG

(5,54)-(5,56)
f
VarG

(5,54)-(5,56)
b
VarG

(5,54)-(5,56)
f b
AppG (fromList [VarG])

(5,54)-(5,56)
true
LitG

(5,54)-(5,56)
false
LitG

(5,54)-(5,56)
(b , true)
TupleG (fromList [VarG,LitG])

(5,54)-(5,56)
(f b , false)
TupleG (fromList [AppG (fromList [EmptyG]),LitG])

*)
