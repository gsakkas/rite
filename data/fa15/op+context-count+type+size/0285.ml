
let rec sumList xs =
  match xs with | [] -> 0 | h -> h | h::t -> h + (sumList t);;


(* fix

let rec sumList xs =
  match xs with | [] -> 0 | h::_ -> h | h::t -> h + (sumList t);;

*)

(* changed spans
(3,2)-(3,60)
*)

(* type error slice
(3,2)-(3,60)
(3,2)-(3,60)
(3,2)-(3,60)
(3,2)-(3,60)
(3,2)-(3,60)
(3,24)-(3,25)
(3,33)-(3,34)
*)
