
let rec listReverse l =
  match l with | [] -> [] | h::t -> h :: (listReverse (listReverse h));;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> h :: (listReverse (listReverse l));;

*)

(* changed spans
(3,67)-(3,68)
*)

(* type error slice
(3,36)-(3,37)
(3,36)-(3,70)
(3,41)-(3,70)
(3,42)-(3,53)
(3,54)-(3,69)
(3,55)-(3,66)
(3,67)-(3,68)
*)

(* all spans
(2,20)-(3,70)
(3,2)-(3,70)
(3,8)-(3,9)
(3,23)-(3,25)
(3,36)-(3,70)
(3,36)-(3,37)
(3,41)-(3,70)
(3,42)-(3,53)
(3,54)-(3,69)
(3,55)-(3,66)
(3,67)-(3,68)
*)
