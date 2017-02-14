
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (if (f b) = b then ((f b), true) else (((f b), false), b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let fx b' = ((f b'), ((f b') = b')) in wwhile (fx, b);;

*)

(* changed spans
(5,2)-(5,8)
(5,2)-(5,67)
(5,9)-(5,67)
(5,13)-(5,22)
(5,16)-(5,17)
(5,21)-(5,22)
(5,28)-(5,41)
(5,29)-(5,34)
(5,30)-(5,31)
(5,32)-(5,33)
(5,36)-(5,40)
(5,47)-(5,66)
(5,49)-(5,54)
(5,50)-(5,51)
(5,52)-(5,53)
(5,56)-(5,61)
*)

(* type error slice
(5,9)-(5,67)
(5,9)-(5,67)
(5,28)-(5,41)
(5,29)-(5,34)
(5,30)-(5,31)
(5,47)-(5,66)
(5,48)-(5,62)
(5,49)-(5,54)
(5,50)-(5,51)
*)
