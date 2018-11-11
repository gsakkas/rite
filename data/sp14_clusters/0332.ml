
let rec wwhile (f,b) =
  match f b with | (i,true ) -> wwhile (f, i) | (i,false ) -> i;;

let fixpoint (f,b) =
  wwhile ((if b = (f b) then (b, false) else ((f b), true)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (i,true ) -> wwhile (f, i) | (i,false ) -> i;;

let fixpoint (f,b) =
  let helper x = if x = (f x) then (x, false) else ((f x), true) in
  wwhile (helper, b);;

*)

(* changed spans
(6,9)-(6,63)
let helper =
  fun x ->
    if x = f x
    then (x , false)
    else (f x , true) in
wwhile (helper , b)
LetG NonRec [LamG EmptyG] (AppG [EmptyG])

(6,10)-(6,59)
fun x ->
  if x = f x
  then (x , false)
  else (f x , true)
LamG (IteG EmptyG EmptyG EmptyG)

(6,14)-(6,15)
x
VarG

(6,21)-(6,22)
x
VarG

(6,30)-(6,31)
x
VarG

(6,49)-(6,50)
x
VarG

(6,61)-(6,62)
wwhile
VarG

(6,61)-(6,62)
helper
VarG

(6,61)-(6,62)
wwhile (helper , b)
AppG [TupleG [EmptyG,EmptyG]]

(6,61)-(6,62)
(helper , b)
TupleG [VarG,VarG]

*)
