
let rec listReverse l =
  match l with | [] -> [] | a::[] -> [a] | a::b::[] -> b :: (listReverse a);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | a::b -> (listReverse b) @ [a];;

*)

(* changed spans
(3,3)-(3,75)
(3,38)-(3,41)
(3,39)-(3,40)
(3,56)-(3,57)
(3,56)-(3,75)
(3,62)-(3,75)
(3,74)-(3,75)
*)

(* type error slice
(2,4)-(3,78)
(2,21)-(3,75)
(3,3)-(3,75)
(3,9)-(3,10)
(3,24)-(3,26)
(3,62)-(3,73)
(3,62)-(3,75)
(3,74)-(3,75)
*)
