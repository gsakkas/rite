
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
(3,24)-(3,25)
(3,33)-(3,34)
*)

(* all spans
(2,16)-(3,60)
(3,2)-(3,60)
(3,8)-(3,10)
(3,24)-(3,25)
(3,33)-(3,34)
(3,45)-(3,60)
(3,45)-(3,46)
(3,49)-(3,60)
(3,50)-(3,57)
(3,58)-(3,59)
*)
