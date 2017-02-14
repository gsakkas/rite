
let rec sumList xs =
  match xs with | [] -> 0 | h -> h | h::t -> h + (sumList t);;


(* fix

let rec sumList xs =
  match xs with | [] -> 0 | h::_ -> h | h::t -> h + (sumList t);;

*)

(* changed spans
(3,3)-(3,60)
*)

(* type error slice
(3,3)-(3,60)
(3,3)-(3,60)
(3,3)-(3,60)
(3,3)-(3,60)
(3,3)-(3,60)
(3,25)-(3,26)
(3,34)-(3,35)
*)
