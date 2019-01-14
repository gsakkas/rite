
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let f' b = (f, ((f b) = b)) in ((f b), b));;


(* fix

let h x = let xx = (x * x) * x in (xx, (xx < 512));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(2,16)-(2,77)
x
VarG

(2,16)-(2,77)
x
VarG

(2,16)-(2,77)
x
VarG

(2,16)-(2,77)
xx
VarG

(2,16)-(2,77)
xx
VarG

(2,16)-(2,77)
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 512))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(2,16)-(2,77)
x * x
BopG VarG VarG

(2,16)-(2,77)
(x * x) * x
BopG (BopG EmptyG EmptyG) VarG

(2,16)-(2,77)
xx < 512
BopG VarG LitG

(2,16)-(2,77)
512
LitG

(2,16)-(2,77)
let xx = (x * x) * x in
(xx , xx < 512)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (TupleG (fromList [EmptyG]))

(2,16)-(2,77)
(xx , xx < 512)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(4,64)-(4,65)
h
VarG

*)
