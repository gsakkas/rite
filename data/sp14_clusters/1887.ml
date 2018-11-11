
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (((=) f), b);;


(* fix

let g h x = let xx = h x in (xx, (xx = (h x)));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((g f), b);;

*)

(* changed spans
(2,16)-(2,77)
h
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
h
VarG

(2,16)-(2,77)
x
VarG

(2,16)-(2,77)
fun h ->
  fun x ->
    (let xx = h x in
     (xx , xx = h x))
LamG (LamG EmptyG)

(2,16)-(2,77)
fun x ->
  (let xx = h x in
   (xx , xx = h x))
LamG (LetG NonRec [EmptyG] EmptyG)

(2,16)-(2,77)
h x
AppG [VarG]

(2,16)-(2,77)
h x
AppG [VarG]

(2,16)-(2,77)
xx = h x
BopG VarG (AppG [EmptyG])

(2,16)-(2,77)
let xx = h x in
(xx , xx = h x)
LetG NonRec [AppG [EmptyG]] (TupleG [EmptyG,EmptyG])

(2,16)-(2,77)
(xx , xx = h x)
TupleG [VarG,BopG EmptyG EmptyG]

(4,30)-(4,33)
g
VarG

*)
