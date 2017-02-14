
let fixpointHelper f =
  match f with | (num,expr) -> if expr then (num, true) else (num, false);;

let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile ((fixpointHelper f), b);;


(* fix

let fixpointHelper f b b = ((f b), (if (f b) = b then true else false));;

let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile ((fixpointHelper f b), b);;

*)

(* changed spans
(3,3)-(3,73)
(3,9)-(3,10)
(3,32)-(3,73)
(3,35)-(3,39)
(3,46)-(3,49)
(3,46)-(3,55)
(3,51)-(3,55)
(3,63)-(3,66)
(3,63)-(3,73)
(8,31)-(8,45)
(8,31)-(8,47)
(8,46)-(8,47)
*)

(* type error slice
(2,4)-(3,76)
(2,20)-(3,73)
(3,3)-(3,73)
(3,32)-(3,73)
(3,46)-(3,55)
(6,9)-(6,10)
(6,9)-(6,12)
(6,47)-(6,53)
(6,47)-(6,61)
(6,55)-(6,56)
(6,55)-(6,61)
(8,22)-(8,28)
(8,22)-(8,51)
(8,31)-(8,45)
(8,31)-(8,47)
(8,31)-(8,51)
*)
