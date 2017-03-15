
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

(* all spans
(2,20)-(5,24)
(3,2)-(5,24)
(3,28)-(4,65)
(4,4)-(4,65)
(4,10)-(4,11)
(4,25)-(4,26)
(4,37)-(4,65)
(4,37)-(4,54)
(4,55)-(4,63)
(4,56)-(4,57)
(4,61)-(4,62)
(4,64)-(4,65)
(5,2)-(5,24)
(5,2)-(5,19)
(5,20)-(5,22)
(5,23)-(5,24)
*)
