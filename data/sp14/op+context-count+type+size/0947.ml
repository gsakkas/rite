
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((if (f b) = b then (true, b) else (false, b)), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let fx b' = ((f b'), ((f b') = b')) in wwhile (fx, b);;

*)

(* changed spans
(5,3)-(5,9)
(5,3)-(5,59)
(5,12)-(5,54)
(5,12)-(5,59)
(5,16)-(5,24)
(5,18)-(5,19)
(5,23)-(5,24)
(5,31)-(5,35)
(5,31)-(5,38)
(5,37)-(5,38)
(5,46)-(5,51)
(5,46)-(5,54)
(5,53)-(5,54)
*)

(* type error slice
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,69)
(2,64)-(2,65)
(2,64)-(2,69)
(5,3)-(5,9)
(5,3)-(5,59)
(5,12)-(5,54)
(5,12)-(5,59)
(5,31)-(5,38)
*)
