
let rec listReverse l =
  match l with | [] -> [] | a::b -> b :: (listReverse a);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | a::b -> (listReverse b) @ [a];;

*)

(* changed spans
(3,37)-(3,38)
(3,37)-(3,56)
(3,43)-(3,56)
(3,55)-(3,56)
*)

(* type error slice
(2,4)-(3,59)
(2,21)-(3,56)
(3,3)-(3,56)
(3,3)-(3,56)
(3,9)-(3,10)
(3,43)-(3,54)
(3,43)-(3,56)
(3,55)-(3,56)
*)
