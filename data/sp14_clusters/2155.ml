
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((f, b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) =
  wwhile ((let f x = let xx = (x * x) * x in (xx, (xx < 100)) in f), b);;

*)

(* changed spans
(5,29)-(5,35)
x
VarG

(5,29)-(5,35)
x
VarG

(5,29)-(5,35)
x
VarG

(5,29)-(5,35)
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 100))
LamG (LetG NonRec [EmptyG] EmptyG)

(5,29)-(5,35)
x * x
BopG VarG VarG

(5,29)-(5,35)
(x * x) * x
BopG (BopG EmptyG EmptyG) VarG

(5,29)-(5,35)
let f =
  fun x ->
    (let xx = (x * x) * x in
     (xx , xx < 100)) in
f
LetG NonRec [LamG EmptyG] VarG

(5,29)-(5,35)
let xx = (x * x) * x in
(xx , xx < 100)
LetG NonRec [BopG EmptyG EmptyG] (TupleG [EmptyG,EmptyG])

(5,30)-(5,31)
xx
VarG

(5,30)-(5,31)
xx
VarG

(5,30)-(5,31)
xx < 100
BopG VarG LitG

(5,30)-(5,31)
100
LitG

*)
