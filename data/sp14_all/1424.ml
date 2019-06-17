
let rec digitsOfInt n =
  if n < 0
  then []
  else
    (match n with
     | 0 -> [0]
     | _ -> if (n / 10) != 0 then (digitsOfInt (n / 10)) @ [n mod 10]);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (match n with
     | 0 -> [0]
     | _ -> if (n / 10) != 0 then (digitsOfInt (n / 10)) @ [n mod 10] else []);;

*)

(* changed spans
(8,70)-(8,70)
[]
ListG []

*)

(* type error slice
(8,13)-(8,70)
(8,35)-(8,70)
(8,58)-(8,59)
(8,70)-(8,70)
*)
