
let rec sumList xs =
  match xs with | [] -> [] | h::t -> let h::t = xs in h + (sumList t);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(3,25)-(3,27)
(3,38)-(3,69)
(3,49)-(3,51)
*)

(* type error slice
(2,4)-(3,72)
(2,17)-(3,69)
(3,3)-(3,69)
(3,3)-(3,69)
(3,25)-(3,27)
(3,38)-(3,69)
(3,55)-(3,69)
(3,55)-(3,69)
(3,60)-(3,67)
(3,60)-(3,69)
*)
