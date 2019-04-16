
let g (f,x) = let xx = f x in (xx, (xx = (f x)));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (g, b);;


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

(6,30)-(6,31)
g f
AppG (fromList [VarG])

*)

(* type error slice
(2,4)-(2,51)
(2,8)-(2,49)
(2,15)-(2,49)
(2,24)-(2,25)
(2,24)-(2,27)
(2,31)-(2,49)
(2,32)-(2,34)
(4,4)-(4,80)
(4,17)-(4,78)
(4,24)-(4,78)
(4,38)-(4,39)
(4,38)-(4,41)
(4,40)-(4,41)
(4,56)-(4,62)
(4,56)-(4,70)
(4,63)-(4,70)
(4,67)-(4,69)
(6,22)-(6,28)
(6,22)-(6,35)
(6,29)-(6,35)
(6,30)-(6,31)
*)
