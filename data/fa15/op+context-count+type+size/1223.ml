
let rec listReverse l = match l with | [] -> [] | x::y -> [listReverse x];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | x::y -> (listReverse y) @ [x];;

*)

(* changed spans
(2,58)-(2,73)
(2,59)-(2,72)
(2,71)-(2,72)
*)

(* type error slice
(2,3)-(2,75)
(2,20)-(2,73)
(2,24)-(2,73)
(2,58)-(2,73)
(2,58)-(2,73)
(2,59)-(2,70)
(2,59)-(2,72)
*)
