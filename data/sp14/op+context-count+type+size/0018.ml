
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let f' = ((f b), ((f b) = b)) in wwhile (f', b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let f b = ((f b), (b = (f b))) in wwhile (f, b);;

*)

(* changed spans
(4,21)-(4,68)
(4,30)-(4,50)
(4,39)-(4,44)
(4,47)-(4,48)
(4,62)-(4,64)
*)

(* type error slice
(2,37)-(2,38)
(2,37)-(2,40)
(2,55)-(2,61)
(2,55)-(2,69)
(2,62)-(2,69)
(2,63)-(2,64)
(4,21)-(4,68)
(4,30)-(4,50)
(4,54)-(4,60)
(4,54)-(4,68)
(4,61)-(4,68)
(4,62)-(4,64)
*)
