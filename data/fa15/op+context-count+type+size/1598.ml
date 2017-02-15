
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper b = if (f b) = b then false else true in wwhile (helper, b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper b = if (f b) = b then (b, false) else ((f b), true) in
  wwhile (helper, b);;

*)

(* changed spans
(5,35)-(5,40)
(5,46)-(5,50)
(5,54)-(5,60)
(5,54)-(5,72)
(5,62)-(5,68)
(5,70)-(5,71)
*)

(* type error slice
(2,23)-(2,77)
(2,37)-(2,38)
(2,37)-(2,40)
(2,55)-(2,61)
(2,55)-(2,69)
(2,62)-(2,69)
(2,63)-(2,64)
(5,2)-(5,72)
(5,13)-(5,50)
(5,17)-(5,50)
(5,35)-(5,40)
(5,54)-(5,60)
(5,54)-(5,72)
(5,61)-(5,72)
(5,62)-(5,68)
*)
