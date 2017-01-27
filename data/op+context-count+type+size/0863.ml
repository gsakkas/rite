
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (((f b) = b), b);;


(* fix

let h x = let xx = (x * x) * x in (xx, (xx < 512));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(2,17)-(2,78)
(4,22)-(4,28)
(4,22)-(4,44)
(4,32)-(4,33)
(4,32)-(4,35)
(4,32)-(4,40)
(4,32)-(4,44)
(4,34)-(4,35)
(4,39)-(4,40)
(4,43)-(4,44)
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
(4,22)-(4,44)
(4,32)-(4,40)
(4,32)-(4,44)
(4,43)-(4,44)
*)
