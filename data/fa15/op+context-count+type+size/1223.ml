
let rec listReverse l = match l with | [] -> [] | x::y -> [listReverse x];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | x::y -> (listReverse y) @ [x];;

*)

(* changed spans
(2,59)-(2,74)
(2,60)-(2,73)
(2,72)-(2,73)
*)

(* type error slice
(2,4)-(2,76)
(2,21)-(2,74)
(2,25)-(2,74)
(2,59)-(2,74)
(2,59)-(2,74)
(2,60)-(2,71)
(2,60)-(2,73)
*)
