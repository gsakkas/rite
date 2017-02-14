
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
(3,2)-(3,56)
(3,23)-(3,24)
(3,35)-(3,56)
(3,51)-(3,52)
*)
