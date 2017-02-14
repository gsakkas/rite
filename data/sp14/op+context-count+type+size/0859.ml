
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let b' = f b in wwhile ((f, (b' = b)), b);;


(* fix

let h x = let xx = (x * x) * x in (xx, (xx < 512));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(2,17)-(2,78)
(2,24)-(2,78)
(4,22)-(4,62)
(4,31)-(4,32)
(4,33)-(4,34)
(4,38)-(4,62)
(4,47)-(4,48)
(4,47)-(4,57)
(4,51)-(4,53)
(4,51)-(4,57)
(4,56)-(4,57)
(4,61)-(4,62)
*)

(* type error slice
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,69)
(2,64)-(2,65)
(2,64)-(2,69)
(4,38)-(4,44)
(4,38)-(4,62)
(4,47)-(4,57)
(4,47)-(4,62)
*)
