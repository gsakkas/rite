
let rec listReverse l =
  match l with | [] -> [] | a::[] -> [a] | a::b::[] -> b :: (listReverse a);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | a::b -> (listReverse b) @ [a];;

*)

(* changed spans
(3,2)-(3,75)
(3,37)-(3,40)
(3,38)-(3,39)
(3,55)-(3,56)
(3,55)-(3,75)
(3,60)-(3,75)
(3,73)-(3,74)
*)

(* type error slice
(2,3)-(3,77)
(2,20)-(3,75)
(3,2)-(3,75)
(3,2)-(3,75)
(3,8)-(3,9)
(3,60)-(3,75)
(3,61)-(3,72)
(3,73)-(3,74)
*)
