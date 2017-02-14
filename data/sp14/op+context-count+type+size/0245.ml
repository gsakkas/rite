
let g (f,x) = let xx = f x in (xx, (xx = (f x)));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((g (f, b)), b);;


(* fix

let g h x = let xx = h x in (xx, (xx = (h x)));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((g f), b);;

*)

(* changed spans
(2,7)-(2,48)
(2,14)-(2,48)
(2,23)-(2,24)
(2,23)-(2,26)
(2,42)-(2,43)
(6,32)-(6,38)
(6,41)-(6,42)
*)

(* type error slice
(2,3)-(2,50)
(2,7)-(2,48)
(2,14)-(2,48)
(2,30)-(2,48)
(4,37)-(4,38)
(4,37)-(4,40)
(4,55)-(4,61)
(4,55)-(4,69)
(4,62)-(4,69)
(4,63)-(4,64)
(6,21)-(6,27)
(6,21)-(6,43)
(6,28)-(6,43)
(6,29)-(6,39)
(6,30)-(6,31)
*)
