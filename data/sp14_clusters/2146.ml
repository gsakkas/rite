
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (f, (f b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) =
  wwhile ((let f x = let xx = (x * x) * x in (xx, (xx < 100)) in f), b);;

*)

(* changed spans
(5,32)-(5,37)
let f =
  fun x ->
    (let xx = (x * x) * x in
     (xx , xx < 100)) in
f
LetG NonRec [LamG EmptyG] VarG

(5,33)-(5,34)
x
VarG

(5,33)-(5,34)
x
VarG

(5,33)-(5,34)
x
VarG

(5,33)-(5,34)
xx
VarG

(5,33)-(5,34)
xx
VarG

(5,33)-(5,34)
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 100))
LamG (LetG NonRec [EmptyG] EmptyG)

(5,33)-(5,34)
x * x
BopG VarG VarG

(5,33)-(5,34)
(x * x) * x
BopG (BopG EmptyG EmptyG) VarG

(5,33)-(5,34)
xx < 100
BopG VarG LitG

(5,33)-(5,34)
100
LitG

(5,33)-(5,34)
let xx = (x * x) * x in
(xx , xx < 100)
LetG NonRec [BopG EmptyG EmptyG] (TupleG [EmptyG,EmptyG])

(5,33)-(5,34)
(xx , xx < 100)
TupleG [VarG,BopG EmptyG EmptyG]

*)
