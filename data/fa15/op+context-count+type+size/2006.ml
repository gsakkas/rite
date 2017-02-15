
let rec listReverse l =
  let rec listReverseHelper l =
    match l with | [] -> l | h::t -> listReverseHelper (h :: l) t in
  listReverseHelper [] l;;


(* fix

let rec listReverse l =
  let rec listReverseHelper l =
    function | [] -> l | h::t -> listReverseHelper (h :: l) t in
  listReverseHelper [] l;;

*)

(* changed spans
(4,4)-(4,65)
(4,10)-(4,11)
*)

(* type error slice
(3,2)-(5,24)
(3,28)-(4,65)
(4,4)-(4,65)
(4,37)-(4,54)
(4,37)-(4,65)
*)
