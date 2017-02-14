
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (f, ((f b) = b), b);;


(* fix

let h x = let xx = (x * x) * x in (xx, (xx < 512));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(2,16)-(2,77)
(2,23)-(2,77)
(4,21)-(4,27)
(4,21)-(4,47)
(4,28)-(4,47)
(4,29)-(4,30)
(4,32)-(4,43)
(4,33)-(4,38)
(4,34)-(4,35)
(4,36)-(4,37)
(4,41)-(4,42)
(4,45)-(4,46)
*)

(* type error slice
(2,55)-(2,61)
(2,55)-(2,69)
(2,62)-(2,69)
(4,21)-(4,27)
(4,21)-(4,47)
(4,28)-(4,47)
*)
