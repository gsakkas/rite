
let rec listReverse l =
  match l with | [] -> 0 | h::t -> (listReverse t) @ [h];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(3,24)-(3,25)
*)

(* type error slice
(3,3)-(3,57)
(3,3)-(3,57)
(3,24)-(3,25)
(3,37)-(3,57)
(3,52)-(3,53)
*)
