
let rec listReverse l =
  match l with | [] -> [] | hd::l' -> 1 + (listReverse l);;


(* fix

let rec listReverse l = match l with | [] -> [] | _::tl -> listReverse tl;;

*)

(* changed spans
(3,3)-(3,57)
(3,39)-(3,40)
(3,39)-(3,57)
(3,56)-(3,57)
*)

(* type error slice
(2,4)-(3,60)
(2,21)-(3,57)
(3,3)-(3,57)
(3,3)-(3,57)
(3,24)-(3,26)
(3,39)-(3,57)
(3,39)-(3,57)
(3,44)-(3,55)
(3,44)-(3,57)
*)
