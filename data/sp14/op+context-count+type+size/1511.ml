
let rec listReverse l =
  match l with | [] -> [] | a::b -> [listReverse b; [a]];;


(* fix

let rec listReverse l = match l with | [] -> [] | b::[] -> [b];;

*)

(* changed spans
(3,3)-(3,57)
(3,37)-(3,57)
(3,38)-(3,49)
(3,38)-(3,51)
(3,50)-(3,51)
*)

(* type error slice
(2,4)-(3,59)
(2,21)-(3,57)
(3,3)-(3,57)
(3,37)-(3,57)
(3,37)-(3,57)
(3,38)-(3,49)
(3,38)-(3,51)
*)
