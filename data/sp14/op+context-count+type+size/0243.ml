
let g f b = (b, (b = (f b)));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (g, b);;


(* fix

let g h x = let xx = h x in (xx, (xx = (h x)));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((g f), b);;

*)

(* changed spans
(2,6)-(2,28)
(2,8)-(2,28)
(2,12)-(2,28)
(2,13)-(2,14)
(2,17)-(2,18)
(2,22)-(2,23)
(2,24)-(2,25)
(4,16)-(4,77)
(6,29)-(6,30)
(6,32)-(6,33)
*)

(* type error slice
(2,3)-(2,30)
(2,6)-(2,28)
(2,8)-(2,28)
(4,23)-(4,77)
(4,37)-(4,38)
(4,37)-(4,40)
(4,55)-(4,61)
(4,55)-(4,69)
(4,62)-(4,69)
(4,63)-(4,64)
(6,21)-(6,27)
(6,21)-(6,34)
(6,28)-(6,34)
(6,29)-(6,30)
*)
