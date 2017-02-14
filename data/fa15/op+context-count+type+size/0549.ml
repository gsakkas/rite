
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let f' b = let b' = f b in (b', (b == b')) in wwhile ((f' b), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let f' b = let b' = f b in (b', (b == b')) in wwhile (f', b);;

*)

(* changed spans
(5,58)-(5,62)
(5,65)-(5,66)
*)

(* type error slice
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,69)
(2,64)-(2,65)
(2,64)-(2,69)
(5,3)-(5,66)
(5,10)-(5,43)
(5,14)-(5,43)
(5,31)-(5,43)
(5,49)-(5,55)
(5,49)-(5,66)
(5,58)-(5,60)
(5,58)-(5,62)
(5,58)-(5,66)
*)
