
let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) = wwhile ((let f' f b = (f b) = b in f'), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' b = if (f b) = b then (b, true) else ((f b), false) in f'), b);;

*)

(* changed spans
(5,43)-(5,52)
if f b = b
then (b , true)
else (f b , false)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(5,56)-(5,58)
b
VarG

(5,56)-(5,58)
f
VarG

(5,56)-(5,58)
b
VarG

(5,56)-(5,58)
f b
AppG (fromList [VarG])

(5,56)-(5,58)
true
LitG

(5,56)-(5,58)
false
LitG

(5,56)-(5,58)
(b , true)
TupleG (fromList [VarG,LitG])

(5,56)-(5,58)
(f b , false)
TupleG (fromList [AppG (fromList [EmptyG]),LitG])

*)
