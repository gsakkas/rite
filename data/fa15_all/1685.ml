
let rec listReverse l =
  match l with | [] -> 0 | h::t -> (listReverse t) @ [h];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(3,23)-(3,24)
[]
ListG EmptyG Nothing

*)
