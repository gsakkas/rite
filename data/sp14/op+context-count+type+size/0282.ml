
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
(8,12)-(8,69)
*)

(* type error slice
(8,12)-(8,69)
(8,12)-(8,69)
(8,12)-(8,69)
(8,34)-(8,69)
(8,57)-(8,58)
*)
