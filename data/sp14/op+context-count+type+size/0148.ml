
let rec digitsOfInt n =
  if n < 0 then [] else [digitsOfInt (n / 10); n mod 10];;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;

*)

(* changed spans
(3,24)-(3,56)
(3,25)-(3,45)
(3,47)-(3,48)
(3,47)-(3,55)
(3,53)-(3,55)
*)

(* type error slice
(2,3)-(3,58)
(2,20)-(3,56)
(3,2)-(3,56)
(3,24)-(3,56)
(3,24)-(3,56)
(3,25)-(3,36)
(3,25)-(3,45)
*)
