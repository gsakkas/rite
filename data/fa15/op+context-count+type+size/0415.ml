
let rec listReverse l = match l with | [] -> [] | a::l' -> listReverse @ a;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | a::l' -> (listReverse l') @ [a];;

*)

(* changed spans
(2,59)-(2,70)
(2,73)-(2,74)
*)

(* type error slice
(2,3)-(2,76)
(2,20)-(2,74)
(2,59)-(2,70)
(2,59)-(2,74)
(2,71)-(2,72)
*)
