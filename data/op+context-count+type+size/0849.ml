
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (f, ((f b) = b), b);;


(* fix

let h x = let xx = (x * x) * x in (xx, (xx < 512));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(2,17)-(2,78)
(4,22)-(4,28)
(4,22)-(4,47)
(4,30)-(4,31)
(4,30)-(4,47)
(4,35)-(4,36)
(4,35)-(4,38)
(4,35)-(4,43)
(4,37)-(4,38)
(4,42)-(4,43)
(4,46)-(4,47)
*)

(* type error slice
(2,38)-(2,39)
(2,38)-(2,41)
(2,40)-(2,41)
(2,56)-(2,62)
(2,56)-(2,69)
(2,64)-(2,65)
(2,64)-(2,69)
(2,67)-(2,69)
(4,22)-(4,28)
(4,22)-(4,47)
(4,30)-(4,31)
(4,30)-(4,47)
(4,35)-(4,43)
(4,46)-(4,47)
*)
