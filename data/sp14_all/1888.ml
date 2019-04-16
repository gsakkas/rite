
let g f b = (b, (b = (f b)));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (g, b);;


(* fix

let g h x = let xx = h x in (xx, (xx = (h x)));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((g f), b);;

*)

(* changed spans
(2,7)-(2,29)
fun h ->
  fun x ->
    (let xx = h x in
     (xx , xx = h x))
LamG VarPatG (LamG VarPatG EmptyG)

(6,30)-(6,31)
g f
AppG (fromList [VarG])

*)

(* type error slice
(2,4)-(2,31)
(2,7)-(2,29)
(2,9)-(2,29)
(4,24)-(4,78)
(4,38)-(4,39)
(4,38)-(4,41)
(4,56)-(4,62)
(4,56)-(4,70)
(4,63)-(4,70)
(4,64)-(4,65)
(6,22)-(6,28)
(6,22)-(6,35)
(6,29)-(6,35)
(6,30)-(6,31)
*)
