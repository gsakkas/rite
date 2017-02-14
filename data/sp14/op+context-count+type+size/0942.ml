
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((f b), ((f b) = b), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let fx b' = ((f b'), ((f b') = b')) in wwhile (fx, b);;

*)

(* changed spans
(4,22)-(4,28)
(4,22)-(4,51)
(4,31)-(4,34)
(4,31)-(4,51)
(4,33)-(4,34)
(4,41)-(4,42)
(4,46)-(4,47)
(4,50)-(4,51)
*)

(* type error slice
(2,56)-(2,62)
(2,56)-(2,69)
(2,64)-(2,69)
(4,22)-(4,28)
(4,22)-(4,51)
(4,31)-(4,51)
*)
