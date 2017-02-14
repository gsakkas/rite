
let rec listReverse l = match l with | [] -> [] | x::y -> listReverse @ x;;


(* fix

let rec listReverse l = match l with | x::[] -> [x];;

*)

(* changed spans
(2,25)-(2,74)
(2,46)-(2,48)
(2,59)-(2,70)
(2,59)-(2,74)
(2,71)-(2,72)
*)

(* type error slice
(2,4)-(2,76)
(2,21)-(2,74)
(2,59)-(2,70)
(2,59)-(2,74)
(2,71)-(2,72)
*)
