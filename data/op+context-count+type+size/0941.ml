
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((((f b) = b), b), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let fx b' = ((f b'), ((f b') = b')) in wwhile (fx, b);;

*)

(* changed spans
(4,22)-(4,28)
(4,22)-(4,49)
(4,33)-(4,41)
(4,33)-(4,45)
(4,33)-(4,49)
(4,35)-(4,36)
(4,40)-(4,41)
(4,44)-(4,45)
(4,48)-(4,49)
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
(4,22)-(4,49)
(4,33)-(4,41)
(4,33)-(4,45)
(4,33)-(4,49)
(4,44)-(4,45)
(4,48)-(4,49)
*)
