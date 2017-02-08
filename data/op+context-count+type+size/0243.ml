
let g f b = (b, (b = (f b)));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (g, b);;


(* fix

let g h x = let xx = h x in (xx, (xx = (h x)));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((g f), b);;

*)

(* changed spans
(2,7)-(2,26)
(2,9)-(2,26)
(2,14)-(2,15)
(2,14)-(2,26)
(2,18)-(2,19)
(2,23)-(2,24)
(2,25)-(2,26)
(4,17)-(4,78)
(6,30)-(6,31)
(6,33)-(6,34)
*)

(* type error slice
(2,4)-(2,31)
(2,7)-(2,26)
(2,9)-(2,26)
(4,24)-(4,78)
(4,38)-(4,39)
(4,38)-(4,41)
(4,56)-(4,62)
(4,56)-(4,69)
(4,64)-(4,65)
(4,64)-(4,69)
(6,22)-(6,28)
(6,22)-(6,34)
(6,30)-(6,31)
(6,30)-(6,34)
*)
