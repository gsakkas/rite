
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
(2,14)-(2,49)
(2,23)-(2,24)
(2,23)-(2,26)
(2,42)-(2,43)
(2,44)-(2,46)
(4,16)-(4,77)
*)

(* type error slice
(2,3)-(2,51)
(2,7)-(2,49)
(2,14)-(2,49)
(2,30)-(2,49)
(4,37)-(4,38)
(4,37)-(4,40)
(4,55)-(4,61)
(4,55)-(4,69)
(4,62)-(4,69)
(4,63)-(4,64)
(6,21)-(6,27)
(6,21)-(6,38)
(6,28)-(6,38)
(6,29)-(6,34)
(6,30)-(6,31)
*)
