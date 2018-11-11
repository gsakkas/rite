
let g (f,x) = let xx = f x in (xx, (xx = (f xx)));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((g f), b);;


(* fix

let g h x = let xx = h x in (xx, (xx = (h x)));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((g f), b);;

*)

(* changed spans
(2,7)-(2,49)
fun h ->
  fun x ->
    (let xx = h x in
     (xx , xx = h x))
LamG (LamG EmptyG)

(2,14)-(2,49)
fun x ->
  (let xx = h x in
   (xx , xx = h x))
LamG (LetG NonRec [EmptyG] EmptyG)

(2,23)-(2,24)
h
VarG

(2,44)-(2,46)
h
VarG

(4,16)-(4,77)
x
VarG

*)
