
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (if (f b) = b then b else wwhile (f, (f b)));;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) =
  wwhile ((let f x = let xx = (x * x) * x in (xx, (xx < 100)) in f), b);;

*)

(* changed spans
(5,65)-(5,70)
let f =
  fun x ->
    (let xx = (x * x) * x in
     (xx , xx < 100)) in
f
LetG NonRec [LamG EmptyG] VarG

(5,66)-(5,67)
x
VarG

(5,66)-(5,67)
x
VarG

(5,66)-(5,67)
x
VarG

(5,66)-(5,67)
xx
VarG

(5,66)-(5,67)
xx
VarG

(5,66)-(5,67)
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 100))
LamG (LetG NonRec [EmptyG] EmptyG)

(5,66)-(5,67)
x * x
BopG VarG VarG

(5,66)-(5,67)
(x * x) * x
BopG (BopG EmptyG EmptyG) VarG

(5,66)-(5,67)
xx < 100
BopG VarG LitG

(5,66)-(5,67)
100
LitG

(5,66)-(5,67)
let xx = (x * x) * x in
(xx , xx < 100)
LetG NonRec [BopG EmptyG EmptyG] (TupleG [EmptyG,EmptyG])

(5,66)-(5,67)
(xx , xx < 100)
TupleG [VarG,BopG EmptyG EmptyG]

*)
