
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let f' b = let b' = f b in (b', (b == b')) in wwhile ((f' b), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let f' b = let b' = f b in (b', (b == b')) in wwhile (f', b);;

*)

(* changed spans
(5,57)-(5,63)
f'
VarG

*)

(* type error slice
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,70)
(2,63)-(2,70)
(2,64)-(2,65)
(5,3)-(5,67)
(5,10)-(5,45)
(5,14)-(5,45)
(5,30)-(5,45)
(5,49)-(5,55)
(5,49)-(5,67)
(5,56)-(5,67)
(5,57)-(5,63)
(5,58)-(5,60)
*)
