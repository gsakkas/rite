
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((fun x  -> x), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) =
  wwhile ((let f x = let xx = (x * x) * x in (xx, (xx < 100)) in f), b);;

*)

(* changed spans
(5,29)-(5,42)
let f =
  fun x ->
    (let xx = (x * x) * x in
     (xx , xx < 100)) in
f
LetG NonRec (fromList [LamG EmptyG]) VarG

(5,40)-(5,41)
x * x
BopG VarG VarG

(5,40)-(5,41)
(x * x) * x
BopG (BopG EmptyG EmptyG) VarG

(5,40)-(5,41)
let xx = (x * x) * x in
(xx , xx < 100)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (TupleG (fromList [EmptyG]))

(5,44)-(5,45)
x
VarG

(5,44)-(5,45)
x
VarG

(5,44)-(5,45)
xx
VarG

(5,44)-(5,45)
xx
VarG

(5,44)-(5,45)
f
VarG

(5,44)-(5,45)
xx < 100
BopG VarG LitG

(5,44)-(5,45)
100
LitG

(5,44)-(5,45)
(xx , xx < 100)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

*)
