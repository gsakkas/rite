
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((if (f b) = b then (true, b) else (false, b)), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let fx b' = ((f b'), ((f b') = b')) in wwhile (fx, b);;

*)

(* changed spans
(5,2)-(5,8)
(5,2)-(5,59)
(5,9)-(5,59)
(5,10)-(5,55)
(5,14)-(5,23)
(5,17)-(5,18)
(5,22)-(5,23)
(5,29)-(5,38)
(5,30)-(5,34)
(5,36)-(5,37)
(5,44)-(5,54)
(5,45)-(5,50)
(5,52)-(5,53)
*)

(* type error slice
(2,37)-(2,38)
(2,37)-(2,40)
(2,55)-(2,61)
(2,55)-(2,69)
(2,62)-(2,69)
(2,63)-(2,64)
(5,2)-(5,8)
(5,2)-(5,59)
(5,9)-(5,59)
(5,10)-(5,55)
(5,29)-(5,38)
*)
