
let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l = match l with | [] -> [] | h::t -> (cat l h) :: t;;


(* fix

let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> listReverse (cat l h);;

*)

(* changed spans
(4,60)-(4,67)
(4,60)-(4,73)
(4,72)-(4,73)
*)

(* type error slice
(2,19)-(2,67)
(2,60)-(2,63)
(2,60)-(2,67)
(2,64)-(2,65)
(2,66)-(2,67)
(4,25)-(4,73)
(4,60)-(4,63)
(4,60)-(4,67)
(4,60)-(4,73)
(4,64)-(4,65)
(4,66)-(4,67)
(4,72)-(4,73)
*)
