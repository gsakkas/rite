
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (((f b) <> b), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (let g x = let xx = f x in (xx, (xx != b)) in (g, b));;

*)

(* changed spans
(5,29)-(5,41)
let g =
  fun x ->
    (let xx = f x in
     (xx , xx <> b)) in
(g , b)
LetG NonRec [LamG EmptyG] (TupleG [EmptyG,EmptyG])

(5,30)-(5,35)
fun x ->
  (let xx = f x in
   (xx , xx <> b))
LamG (LetG NonRec [EmptyG] EmptyG)

(5,30)-(5,35)
let xx = f x in (xx , xx <> b)
LetG NonRec [AppG [EmptyG]] (TupleG [EmptyG,EmptyG])

(5,33)-(5,34)
x
VarG

(5,39)-(5,40)
xx
VarG

(5,39)-(5,40)
xx
VarG

(5,39)-(5,40)
xx <> b
BopG VarG VarG

(5,39)-(5,40)
(xx , xx <> b)
TupleG [VarG,BopG EmptyG EmptyG]

(5,43)-(5,44)
g
VarG

(5,43)-(5,44)
(g , b)
TupleG [VarG,VarG]

*)
