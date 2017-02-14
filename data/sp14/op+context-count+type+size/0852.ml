
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((f, (b = (f b))), b);;


(* fix

let h x = let xx = (x * x) * x in (xx, (xx < 512));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(2,16)-(2,77)
(2,23)-(2,77)
(4,21)-(4,27)
(4,21)-(4,49)
(4,28)-(4,49)
(4,29)-(4,45)
(4,30)-(4,31)
(4,33)-(4,44)
(4,34)-(4,35)
(4,38)-(4,43)
(4,39)-(4,40)
(4,41)-(4,42)
(4,47)-(4,48)
*)

(* type error slice
(2,37)-(2,38)
(2,37)-(2,40)
(2,55)-(2,61)
(2,55)-(2,69)
(2,62)-(2,69)
(2,63)-(2,64)
(4,21)-(4,27)
(4,21)-(4,49)
(4,28)-(4,49)
(4,29)-(4,45)
*)
