
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (if (f b) = b then ((f b), true) else (((f b), false), b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let fx b' = ((f b'), ((f b') = b')) in wwhile (fx, b);;

*)

(* changed spans
(5,3)-(5,9)
(5,3)-(5,66)
(5,11)-(5,66)
(5,15)-(5,23)
(5,17)-(5,18)
(5,22)-(5,23)
(5,31)-(5,32)
(5,31)-(5,34)
(5,31)-(5,41)
(5,33)-(5,34)
(5,37)-(5,41)
(5,51)-(5,52)
(5,51)-(5,54)
(5,51)-(5,66)
(5,53)-(5,54)
(5,57)-(5,62)
*)

(* type error slice
(5,11)-(5,66)
(5,11)-(5,66)
(5,31)-(5,32)
(5,31)-(5,34)
(5,31)-(5,41)
(5,51)-(5,52)
(5,51)-(5,54)
(5,51)-(5,62)
(5,51)-(5,66)
*)
