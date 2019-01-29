
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((f (if (f b) = b then 1 else 0)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) =
  wwhile ((let f x = let xx = (x * x) * x in (xx, (xx < 100)) in f), b);;

*)

(* changed spans
(5,36)-(5,41)
let f =
  fun x ->
    (let xx = (x * x) * x in
     (xx , xx < 100)) in
f
LetG NonRec (fromList [LamG EmptyG]) VarG

(5,37)-(5,38)
x
VarG

(5,37)-(5,38)
x
VarG

(5,37)-(5,38)
x
VarG

(5,37)-(5,38)
xx
VarG

(5,37)-(5,38)
xx
VarG

(5,37)-(5,38)
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 100))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(5,37)-(5,38)
x * x
BopG VarG VarG

(5,37)-(5,38)
(x * x) * x
BopG (BopG EmptyG EmptyG) VarG

(5,37)-(5,38)
xx < 100
BopG VarG LitG

(5,37)-(5,38)
100
LitG

(5,37)-(5,38)
let xx = (x * x) * x in
(xx , xx < 100)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (TupleG (fromList [EmptyG]))

(5,37)-(5,38)
(xx , xx < 100)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

*)
