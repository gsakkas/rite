
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let b' = f b in let f' = (b', (b == b')) in wwhile (f', b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let f' b = let b' = f b in (b', (b == b')) in wwhile (f', b);;

*)

(* changed spans
(5,3)-(5,60)
(5,12)-(5,15)
(5,19)-(5,60)
*)

(* type error slice
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,69)
(2,64)-(2,65)
(2,64)-(2,69)
(5,19)-(5,60)
(5,29)-(5,41)
(5,47)-(5,53)
(5,47)-(5,60)
(5,55)-(5,57)
(5,55)-(5,60)
*)
