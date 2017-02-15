
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let b' = f b in let f' = (b', (b == b')) in wwhile (f', b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let f' b = let b' = f b in (b', (b == b')) in wwhile (f', b);;

*)

(* changed spans
(5,2)-(5,60)
(5,11)-(5,14)
(5,18)-(5,60)
*)

(* type error slice
(2,37)-(2,38)
(2,37)-(2,40)
(2,55)-(2,61)
(2,55)-(2,69)
(2,62)-(2,69)
(2,63)-(2,64)
(5,18)-(5,60)
(5,27)-(5,42)
(5,46)-(5,52)
(5,46)-(5,60)
(5,53)-(5,60)
(5,54)-(5,56)
*)
