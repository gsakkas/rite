
let rec listReverse l = match l with | [] -> [] | x::y -> listReverse @ x;;


(* fix

let rec listReverse l = match l with | x::[] -> [x];;

*)

(* changed spans
(2,24)-(2,73)
(2,45)-(2,47)
(2,58)-(2,69)
(2,58)-(2,73)
(2,70)-(2,71)
*)

(* type error slice
(2,3)-(2,75)
(2,20)-(2,73)
(2,58)-(2,69)
(2,58)-(2,73)
(2,70)-(2,71)
*)
