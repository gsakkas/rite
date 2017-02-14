
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((f b), ((f b) = b), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let fx b' = ((f b'), ((f b') = b')) in wwhile (fx, b);;

*)

(* changed spans
(4,21)-(4,27)
(4,21)-(4,51)
(4,28)-(4,51)
(4,29)-(4,34)
(4,32)-(4,33)
(4,40)-(4,41)
(4,45)-(4,46)
(4,49)-(4,50)
*)

(* type error slice
(2,55)-(2,61)
(2,55)-(2,69)
(2,62)-(2,69)
(4,21)-(4,27)
(4,21)-(4,51)
(4,28)-(4,51)
*)
