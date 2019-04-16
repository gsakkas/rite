
let g (f,x) = let xx = f x in (xx, (xx = (f x)));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((g (f, b)), b);;


(* fix

let g h x = let xx = h x in (xx, (xx = (h x)));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((g f), b);;

*)

(* changed spans
(2,8)-(2,49)
fun h ->
  fun x ->
    (let xx = h x in
     (xx , xx = h x))
LamG VarPatG (LamG VarPatG EmptyG)

(6,33)-(6,39)
f
VarG

*)

(* type error slice
(2,4)-(2,51)
(2,8)-(2,49)
(2,15)-(2,49)
(2,31)-(2,49)
(4,38)-(4,39)
(4,38)-(4,41)
(4,56)-(4,62)
(4,56)-(4,70)
(4,63)-(4,70)
(4,64)-(4,65)
(6,22)-(6,28)
(6,22)-(6,44)
(6,29)-(6,44)
(6,30)-(6,40)
(6,31)-(6,32)
*)
