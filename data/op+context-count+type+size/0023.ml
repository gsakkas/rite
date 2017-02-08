
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let f' = ((f b), ((f b) = b)) in wwhile (f', b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let f b = ((f b), (b = (f b))) in wwhile (f, b);;

*)

(* changed spans
(4,22)-(4,68)
(4,33)-(4,49)
(4,41)-(4,44)
(4,48)-(4,49)
(4,63)-(4,65)
*)

(* type error slice
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,69)
(2,64)-(2,65)
(2,64)-(2,69)
(4,22)-(4,68)
(4,33)-(4,49)
(4,55)-(4,61)
(4,55)-(4,68)
(4,63)-(4,65)
(4,63)-(4,68)
*)
