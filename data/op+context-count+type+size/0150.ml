
let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) :: (n mod 10);;



let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;


(* changed spans
(3,48)-(3,52)
*)

(* type error slice
(3,26)-(3,60)
*)
