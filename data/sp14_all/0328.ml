
let rec wwhile (f,b) =
  match f b with | (i,true ) -> wwhile (f, i) | (i,false ) -> i;;

let fixpoint (f,b) =
  wwhile (if b = (f b) then (b, false) else (((f b), true), b));;


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
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(6,9)-(6,63)
fun x ->
  if b = f b
  then (b , false)
  else (b , true)
LamG (IteG EmptyG EmptyG EmptyG)

(6,60)-(6,61)
wwhile
VarG

(6,60)-(6,61)
helper
VarG

(6,60)-(6,61)
wwhile (helper , b)
AppG (fromList [TupleG (fromList [EmptyG])])

(6,60)-(6,61)
(helper , b)
TupleG (fromList [VarG])

*)
