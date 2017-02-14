
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((if (f b) = b then ((f b), true) else ((f b), false)), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let fx b' = ((f b'), ((f b') = b')) in wwhile (fx, b);;

*)

(* changed spans
(5,2)-(5,8)
(5,2)-(5,67)
(5,9)-(5,67)
(5,10)-(5,63)
(5,14)-(5,23)
(5,17)-(5,18)
(5,22)-(5,23)
(5,29)-(5,42)
(5,30)-(5,35)
(5,33)-(5,34)
(5,37)-(5,41)
(5,48)-(5,62)
(5,49)-(5,54)
(5,50)-(5,51)
(5,52)-(5,53)
(5,56)-(5,61)
(5,65)-(5,66)
*)

(* type error slice
(2,37)-(2,38)
(2,37)-(2,40)
(2,55)-(2,61)
(2,55)-(2,69)
(2,62)-(2,69)
(2,63)-(2,64)
(5,2)-(5,8)
(5,2)-(5,67)
(5,9)-(5,67)
(5,10)-(5,63)
(5,29)-(5,42)
*)
