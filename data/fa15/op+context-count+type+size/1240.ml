
let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile (0, b);;


(* fix

let fixpointHelper f b b = ((f b), (if (f b) = b then true else false));;

let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile ((fixpointHelper f b), b);;

*)

(* changed spans
(2,17)-(3,71)
(3,3)-(3,71)
(3,9)-(3,12)
(3,37)-(3,41)
(3,47)-(3,53)
(3,55)-(3,61)
(3,58)-(3,61)
(3,68)-(3,71)
(5,15)-(5,34)
(5,22)-(5,28)
(5,22)-(5,34)
(5,30)-(5,31)
(5,30)-(5,34)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,47)-(3,53)
(3,47)-(3,61)
(3,55)-(3,56)
(3,55)-(3,61)
(5,22)-(5,28)
(5,22)-(5,34)
(5,30)-(5,31)
(5,30)-(5,34)
*)
