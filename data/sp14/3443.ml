
let rec listReverse l =
  match l with | [] -> [] | x::l -> x :: (listReverse l x);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | x::l -> x :: (listReverse l);;

*)

(* changed spans
(3,41)-(3,58)
(3,56)-(3,57)
*)

(* type error slice
(2,3)-(3,60)
(2,20)-(3,58)
(3,2)-(3,58)
(3,36)-(3,58)
(3,41)-(3,58)
(3,42)-(3,53)
*)

(* all spans
(2,20)-(3,58)
(3,2)-(3,58)
(3,8)-(3,9)
(3,23)-(3,25)
(3,36)-(3,58)
(3,36)-(3,37)
(3,41)-(3,58)
(3,42)-(3,53)
(3,54)-(3,55)
(3,56)-(3,57)
*)
