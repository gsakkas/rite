
let fixpointHelper (f,b) = if (f b) = b then (b, true) else (b, false);;

let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile ((fixpointHelper (f, b)), b);;


(* fix

let fixpointHelper f b b = ((f b), (if (f b) = b then true else false));;

let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile ((fixpointHelper f b), b);;

*)

(* changed spans
(2,20)-(2,70)
(2,27)-(2,70)
(2,45)-(2,54)
(2,46)-(2,47)
(2,60)-(2,70)
(2,61)-(2,62)
(7,29)-(7,52)
(7,45)-(7,51)
*)

(* type error slice
(2,3)-(2,72)
(2,20)-(2,70)
(2,27)-(2,70)
(2,45)-(2,54)
(5,8)-(5,9)
(5,8)-(5,11)
(5,46)-(5,52)
(5,46)-(5,61)
(5,53)-(5,61)
(5,54)-(5,55)
(7,21)-(7,27)
(7,21)-(7,56)
(7,28)-(7,56)
(7,29)-(7,52)
(7,30)-(7,44)
*)
