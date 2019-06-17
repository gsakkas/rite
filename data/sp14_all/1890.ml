
let g (f,x) = let xx = f x in (xx, (xx = (f xx)));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((g f), b);;


(* fix

let g h x = let xx = h x in (xx, (xx = (h x)));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((g f), b);;

*)

(* changed spans
(2,8)-(2,50)
fun h ->
  fun x ->
    (let xx = h x in
     (xx , xx = h x))
LamG VarPatG (LamG EmptyPatG EmptyG)

*)

(* type error slice
(2,4)-(2,52)
(2,8)-(2,50)
(2,15)-(2,50)
(2,31)-(2,50)
(4,38)-(4,39)
(4,38)-(4,41)
(4,56)-(4,62)
(4,56)-(4,70)
(4,63)-(4,70)
(4,64)-(4,65)
(6,22)-(6,28)
(6,22)-(6,39)
(6,29)-(6,39)
(6,30)-(6,35)
(6,31)-(6,32)
*)
