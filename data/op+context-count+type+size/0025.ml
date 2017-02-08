
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let f' f b = ((f b), (b = (f b))) in wwhile (f', b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let f b = ((f b), ((f b) = b)) in wwhile (f, b);;

*)

(* changed spans
(4,22)-(4,72)
(4,29)-(4,52)
(4,44)-(4,45)
(4,49)-(4,52)
(4,59)-(4,72)
(4,67)-(4,69)
*)

(* type error slice
(2,24)-(2,78)
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,69)
(2,64)-(2,65)
(2,64)-(2,69)
(4,22)-(4,72)
(4,29)-(4,52)
(4,31)-(4,52)
(4,59)-(4,65)
(4,59)-(4,72)
(4,67)-(4,69)
(4,67)-(4,72)
*)
