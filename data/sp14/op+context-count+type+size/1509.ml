
let rec listReverse l =
  match l with | [] -> [] | a::b -> b :: (listReverse a);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | a::b -> (listReverse b) @ [a];;

*)

(* changed spans
(3,36)-(3,37)
(3,36)-(3,56)
(3,41)-(3,56)
(3,54)-(3,55)
*)

(* type error slice
(2,3)-(3,58)
(2,20)-(3,56)
(3,2)-(3,56)
(3,2)-(3,56)
(3,8)-(3,9)
(3,41)-(3,56)
(3,42)-(3,53)
(3,54)-(3,55)
*)
