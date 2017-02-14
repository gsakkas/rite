
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
(2,21)-(2,70)
(2,28)-(2,70)
(2,47)-(2,48)
(2,47)-(2,54)
(2,62)-(2,63)
(2,62)-(2,70)
(7,31)-(7,51)
(7,47)-(7,51)
*)

(* type error slice
(2,4)-(2,73)
(2,21)-(2,70)
(2,28)-(2,70)
(2,47)-(2,54)
(5,9)-(5,10)
(5,9)-(5,12)
(5,47)-(5,53)
(5,47)-(5,61)
(5,55)-(5,56)
(5,55)-(5,61)
(7,22)-(7,28)
(7,22)-(7,56)
(7,31)-(7,45)
(7,31)-(7,51)
(7,31)-(7,56)
*)
