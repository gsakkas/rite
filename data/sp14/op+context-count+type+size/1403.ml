
let rec listReverse l =
  match l with | [] -> [] | h::t -> h :: (l listReverse t);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [];;

*)

(* changed spans
(3,37)-(3,38)
(3,37)-(3,58)
(3,43)-(3,44)
(3,45)-(3,56)
*)

(* type error slice
(3,3)-(3,58)
(3,3)-(3,58)
(3,3)-(3,58)
(3,3)-(3,58)
(3,9)-(3,10)
(3,43)-(3,44)
(3,43)-(3,58)
*)
