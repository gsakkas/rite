
let rec digitsOfInt n =
  if n < 0 then [] else (match n with | h::t -> h :: (digitsOfInt t));;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else (match n with | n_ -> (n_ mod 10) :: (digitsOfInt n_));;

*)

(* changed spans
(3,6)-(3,11)
(3,26)-(3,68)
(3,49)-(3,50)
(3,55)-(3,68)
(3,67)-(3,68)
*)

(* type error slice
(3,6)-(3,7)
(3,6)-(3,11)
(3,6)-(3,11)
(3,10)-(3,11)
(3,26)-(3,68)
(3,26)-(3,68)
(3,32)-(3,33)
*)
