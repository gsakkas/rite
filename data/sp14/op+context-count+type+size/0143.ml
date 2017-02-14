
let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) :: (n mod 10);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;

*)

(* changed spans
(3,24)-(3,46)
(3,24)-(3,60)
(3,50)-(3,60)
(3,51)-(3,52)
(3,57)-(3,59)
*)

(* type error slice
(2,3)-(3,62)
(2,20)-(3,60)
(3,2)-(3,60)
(3,24)-(3,46)
(3,24)-(3,60)
(3,24)-(3,60)
(3,24)-(3,60)
(3,25)-(3,36)
(3,50)-(3,60)
*)
