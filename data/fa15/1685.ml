
let rec listReverse l =
  match l with | [] -> 0 | h::t -> (listReverse t) @ [h];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(3,23)-(3,24)
*)

(* type error slice
(3,2)-(3,56)
(3,23)-(3,24)
(3,35)-(3,56)
(3,51)-(3,52)
*)

(* all spans
(2,20)-(3,56)
(3,2)-(3,56)
(3,8)-(3,9)
(3,23)-(3,24)
(3,35)-(3,56)
(3,51)-(3,52)
(3,35)-(3,50)
(3,36)-(3,47)
(3,48)-(3,49)
(3,53)-(3,56)
(3,54)-(3,55)
*)
