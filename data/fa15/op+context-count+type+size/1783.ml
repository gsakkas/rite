
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
(5,36)-(5,41)
(5,47)-(5,51)
(5,55)-(5,61)
(5,55)-(5,72)
(5,63)-(5,69)
(5,71)-(5,72)
*)

(* type error slice
(2,24)-(2,78)
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,69)
(2,64)-(2,65)
(2,64)-(2,69)
(5,3)-(5,72)
(5,14)-(5,51)
(5,18)-(5,51)
(5,36)-(5,41)
(5,55)-(5,61)
(5,55)-(5,72)
(5,63)-(5,69)
(5,63)-(5,72)
*)
