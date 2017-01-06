
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) :: h;;



let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;


(* changed spans
(3,53)-(3,55)
*)

(* type error slice
(3,38)-(3,51)
*)
