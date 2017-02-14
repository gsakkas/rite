
let rec listReverse l =
  let rec go i = function | [] -> i | h::t -> i (h :: i) t in go [] l;;


(* fix

let rec listReverse l =
  let rec go i = function | [] -> i | h::t -> go (h :: i) t in go [] l;;

*)

(* changed spans
(3,47)-(3,48)
*)

(* type error slice
(3,47)-(3,48)
(3,47)-(3,59)
(3,50)-(3,56)
(3,55)-(3,56)
*)
