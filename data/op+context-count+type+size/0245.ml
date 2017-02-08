
let g (f,x) = let xx = f x in (xx, (xx = (f x)));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((g (f, b)), b);;


(* fix

let g h x = let xx = h x in (xx, (xx = (h x)));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((g f), b);;

*)

(* changed spans
(2,8)-(2,46)
(2,15)-(2,46)
(2,24)-(2,25)
(2,24)-(2,27)
(2,43)-(2,44)
(6,34)-(6,38)
(6,42)-(6,43)
*)

(* type error slice
(2,4)-(2,51)
(2,8)-(2,46)
(2,15)-(2,46)
(2,32)-(2,46)
(4,38)-(4,39)
(4,38)-(4,41)
(4,56)-(4,62)
(4,56)-(4,69)
(4,64)-(4,65)
(4,64)-(4,69)
(6,22)-(6,28)
(6,22)-(6,43)
(6,31)-(6,32)
(6,31)-(6,38)
(6,31)-(6,43)
*)
