
let rec listReverse l =
  match l with | [] -> [] | x::l' -> [listReverse l'; x];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | x::l' -> (listReverse l') @ [x];;

*)

(* changed spans
(3,38)-(3,57)
(3,39)-(3,53)
(3,55)-(3,56)
*)

(* type error slice
(2,4)-(3,59)
(2,21)-(3,57)
(3,3)-(3,57)
(3,38)-(3,57)
(3,38)-(3,57)
(3,39)-(3,50)
(3,39)-(3,53)
*)
