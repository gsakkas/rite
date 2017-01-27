
let rec listReverse l =
  match l with | [] -> [] | a::b::[] -> (listReverse b) @ a;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | a::b -> (listReverse b) @ [a];;

*)

(* changed spans
(3,3)-(3,60)
(3,59)-(3,60)
*)

(* type error slice
(2,4)-(3,62)
(2,21)-(3,60)
(3,3)-(3,60)
(3,9)-(3,10)
(3,24)-(3,26)
(3,42)-(3,53)
(3,42)-(3,55)
(3,54)-(3,55)
*)
