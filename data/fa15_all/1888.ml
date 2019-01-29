
let g f b = (b, (b = (f b)));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (g, b);;


(* fix

let g h x = let xx = h x in (xx, (xx = (h x)));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((g f), b);;

*)

(* changed spans
(2,8)-(2,28)
fun h ->
  fun x ->
    (let xx = h x in
     (xx , xx = h x))
LamG (LamG EmptyG)

(2,12)-(2,28)
h
VarG

(2,12)-(2,28)
x
VarG

(2,12)-(2,28)
fun x ->
  (let xx = h x in
   (xx , xx = h x))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(2,12)-(2,28)
h x
AppG (fromList [VarG])

(2,12)-(2,28)
let xx = h x in
(xx , xx = h x)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(2,13)-(2,14)
xx
VarG

(2,17)-(2,18)
xx
VarG

(2,24)-(2,25)
h
VarG

(4,16)-(4,77)
x
VarG

(6,29)-(6,30)
g f
AppG (fromList [VarG])

(6,32)-(6,33)
f
VarG

*)
