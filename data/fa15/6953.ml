
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
(2,16)-(3,70)
(5,29)-(5,30)
(5,32)-(5,33)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(3,46)-(3,52)
(3,46)-(3,61)
(3,53)-(3,61)
(3,54)-(3,55)
(5,21)-(5,27)
(5,21)-(5,34)
(5,28)-(5,34)
(5,29)-(5,30)
*)

(* all spans
(2,16)-(3,70)
(3,2)-(3,70)
(3,8)-(3,11)
(3,8)-(3,9)
(3,10)-(3,11)
(3,33)-(3,70)
(3,36)-(3,40)
(3,46)-(3,61)
(3,46)-(3,52)
(3,53)-(3,61)
(3,54)-(3,55)
(3,57)-(3,60)
(3,67)-(3,70)
(5,14)-(5,34)
(5,21)-(5,34)
(5,21)-(5,27)
(5,28)-(5,34)
(5,29)-(5,30)
(5,32)-(5,33)
*)
