
let rec wwhile (f,b) = match f b with | (a,c) -> if not c then a else f a;;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

*)

(* changed spans
(2,71)-(2,72)
*)

(* type error slice
(2,24)-(2,74)
(2,30)-(2,31)
(2,30)-(2,33)
(2,32)-(2,33)
(2,50)-(2,74)
(2,53)-(2,56)
(2,53)-(2,58)
(2,57)-(2,58)
(2,64)-(2,65)
(2,71)-(2,72)
(2,71)-(2,74)
(2,73)-(2,74)
*)
