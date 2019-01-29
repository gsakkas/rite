
let rec wwhile (f,b) =
  match f b with | (i,true ) -> wwhile (f, i) | (i,false ) -> i;;

let fixpoint (f,b) = wwhile (if b = (f b) then b else ((f b), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (i,true ) -> wwhile (f, i) | (i,false ) -> i;;

let fixpoint (f,b) =
  let helper x = if b = (f b) then (b, false) else (b, true) in
  wwhile (helper, b);;

*)

(* changed spans
(5,21)-(5,27)
let helper =
  fun x ->
    if b = f b
    then (b , false)
    else (b , true) in
wwhile (helper , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(5,28)-(5,65)
fun x ->
  if b = f b
  then (b , false)
  else (b , true)
LamG (IteG EmptyG EmptyG EmptyG)

(5,47)-(5,48)
(b , false)
TupleG (fromList [VarG,LitG])

(5,54)-(5,64)
false
LitG

(5,62)-(5,63)
wwhile
VarG

(5,62)-(5,63)
helper
VarG

(5,62)-(5,63)
wwhile (helper , b)
AppG (fromList [TupleG (fromList [EmptyG])])

(5,62)-(5,63)
true
LitG

(5,62)-(5,63)
(helper , b)
TupleG (fromList [VarG])

*)
