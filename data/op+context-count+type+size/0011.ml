
let rec sumList xs =
  match xs with | [] -> [] | h1::h2::t -> h1 + (h2 sumList t);;



let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;


(* changed spans
(3,25)-(3,27)
(3,30)-(3,36)
(3,38)-(3,39)
(3,43)-(3,45)
(3,49)-(3,51)
(3,60)-(3,61)
*)

(* type error slice
(3,49)-(3,61)
*)
