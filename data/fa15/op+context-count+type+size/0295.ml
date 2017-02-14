
let rec listReverse l =
  let rec go i = function | [] -> i | h::t -> i (h :: i) t in go [] l;;


(* fix

let rec listReverse l =
  let rec go i = function | [] -> i | h::t -> go (h :: i) t in go [] l;;

*)

(* changed spans
(3,46)-(3,47)
*)

(* type error slice
(3,46)-(3,47)
(3,46)-(3,58)
(3,48)-(3,56)
(3,54)-(3,55)
*)
