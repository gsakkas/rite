
let rec wwhile (f,b) =
  match f b with | (i,true ) -> wwhile (f, i) | (i,false ) -> i;;

let fixpoint (f,b) =
  wwhile (if b = (f b) then (b, false) else ((b, true), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (i,true ) -> wwhile (f, i) | (i,false ) -> i;;

let fixpoint (f,b) =
  let helper x = if b = (f b) then (b, false) else (b, true) in
  wwhile (helper, b);;

*)

(* changed spans
(6,2)-(6,8)
let helper =
  fun x ->
    if b = f b
    then (b , false)
    else (b , true) in
wwhile (helper , b)
LetG NonRec [LamG EmptyG] (AppG [EmptyG])

(6,9)-(6,59)
fun x ->
  if b = f b
  then (b , false)
  else (b , true)
LamG (IteG EmptyG EmptyG EmptyG)

(6,56)-(6,57)
wwhile
VarG

(6,56)-(6,57)
helper
VarG

(6,56)-(6,57)
wwhile (helper , b)
AppG [TupleG [EmptyG,EmptyG]]

(6,56)-(6,57)
(helper , b)
TupleG [VarG,VarG]

*)
