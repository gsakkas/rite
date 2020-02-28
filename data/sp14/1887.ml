
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (((=) f), b);;


(* fix

let g h x = let xx = h x in (xx, (xx = (h x)));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((g f), b);;

*)

(* changed spans
(4,30)-(4,37)
g f
AppG [VarG]

*)

(* type error slice
(2,24)-(2,78)
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,70)
(2,63)-(2,70)
(2,64)-(2,65)
(4,22)-(4,28)
(4,22)-(4,41)
(4,29)-(4,41)
(4,30)-(4,37)
(4,31)-(4,34)
*)
