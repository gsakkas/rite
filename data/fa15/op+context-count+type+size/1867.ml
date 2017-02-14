
let rec listReverse l =
  match l with | [] -> [] | h::t -> let r = listReverse t in r :: h;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> let r = listReverse t in r @ [h];;

*)

(* changed spans
(3,61)-(3,62)
(3,61)-(3,67)
(3,66)-(3,67)
*)

(* type error slice
(2,3)-(3,69)
(2,20)-(3,67)
(3,2)-(3,67)
(3,36)-(3,67)
(3,36)-(3,67)
(3,44)-(3,55)
(3,44)-(3,57)
(3,61)-(3,62)
(3,61)-(3,67)
(3,61)-(3,67)
*)
