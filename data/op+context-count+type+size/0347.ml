
let rec digitsOfInt n =
  if n < 0
  then []
  else
    (match n with
     | 0 -> [0]
     | _ -> if (n / 10) != 0 then (digitsOfInt (n / 10)) @ [n mod 10]);;



let rec digitsOfInt n =
  if n < 0
  then []
  else
    (match n with
     | 0 -> [0]
     | _ -> if (n / 10) != 0 then (digitsOfInt (n / 10)) @ [n mod 10] else []);;


(* changed spans
*)

(* type error slice
(8,36)-(8,70)
*)
