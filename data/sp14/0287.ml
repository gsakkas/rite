
let rec listReverse l =
  match l with | [] -> [] | h::t -> h :: (l listReverse t);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> h :: (listReverse t);;

*)

(* changed spans
(3,41)-(3,58)
(3,42)-(3,43)
*)

(* type error slice
(3,2)-(3,58)
(3,8)-(3,9)
(3,41)-(3,58)
(3,42)-(3,43)
*)

(* all spans
(2,20)-(3,58)
(3,2)-(3,58)
(3,8)-(3,9)
(3,23)-(3,25)
(3,36)-(3,58)
(3,36)-(3,37)
(3,41)-(3,58)
(3,42)-(3,43)
(3,44)-(3,55)
(3,56)-(3,57)
*)
