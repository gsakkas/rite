
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let f' b = let b' = f b in (b', (b == b')) in wwhile ((f' b), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let f' b = let b' = f b in (b', (b == b')) in wwhile (f', b);;

*)

(* changed spans
(5,56)-(5,62)
(5,64)-(5,65)
*)

(* type error slice
(2,37)-(2,38)
(2,37)-(2,40)
(2,55)-(2,61)
(2,55)-(2,69)
(2,62)-(2,69)
(2,63)-(2,64)
(5,2)-(5,66)
(5,9)-(5,44)
(5,13)-(5,44)
(5,29)-(5,44)
(5,48)-(5,54)
(5,48)-(5,66)
(5,55)-(5,66)
(5,56)-(5,62)
(5,57)-(5,59)
*)
