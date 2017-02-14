
let rec listReverse l =
  match l with | [] -> [] | a::b::[] -> (listReverse b) @ a;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | a::b -> (listReverse b) @ [a];;

*)

(* changed spans
(3,2)-(3,59)
(3,58)-(3,59)
*)

(* type error slice
(2,3)-(3,61)
(2,20)-(3,59)
(3,2)-(3,59)
(3,2)-(3,59)
(3,2)-(3,59)
(3,8)-(3,9)
(3,40)-(3,55)
(3,41)-(3,52)
(3,53)-(3,54)
*)
