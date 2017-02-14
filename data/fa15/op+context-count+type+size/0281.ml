
let rec listReverse l = match l with | [] -> [] | h::t -> [listReverse t] @ h;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(2,58)-(2,73)
(2,76)-(2,77)
*)

(* type error slice
(2,3)-(2,79)
(2,20)-(2,77)
(2,24)-(2,77)
(2,58)-(2,73)
(2,58)-(2,73)
(2,58)-(2,77)
(2,59)-(2,70)
(2,59)-(2,72)
(2,74)-(2,75)
*)
