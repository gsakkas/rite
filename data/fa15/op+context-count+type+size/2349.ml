
let rec sumList xs =
  match xs with | [] -> [] | h::t -> let h::t = xs in h + (sumList t);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(3,24)-(3,26)
(3,37)-(3,69)
(3,48)-(3,50)
*)

(* type error slice
(2,3)-(3,71)
(2,16)-(3,69)
(3,2)-(3,69)
(3,2)-(3,69)
(3,24)-(3,26)
(3,37)-(3,69)
(3,54)-(3,69)
(3,54)-(3,69)
(3,58)-(3,69)
(3,59)-(3,66)
*)
