
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let b' = f b in wwhile (f, (b' = b), b);;


(* fix

let h x = let xx = (x * x) * x in (xx, (xx < 512));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(2,16)-(2,77)
(2,23)-(2,77)
(4,21)-(4,60)
(4,30)-(4,31)
(4,32)-(4,33)
(4,37)-(4,43)
(4,37)-(4,60)
(4,44)-(4,60)
(4,45)-(4,46)
(4,48)-(4,56)
(4,49)-(4,51)
(4,54)-(4,55)
(4,58)-(4,59)
*)

(* type error slice
(2,55)-(2,61)
(2,55)-(2,69)
(2,62)-(2,69)
(4,37)-(4,43)
(4,37)-(4,60)
(4,44)-(4,60)
*)
