
let rec digitsOfInt n =
  if n <= 0 then [] else (List.rev (n mod 10)) :: (digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else List.rev ((n mod 10) :: (digitsOfInt (n / 10)));;

*)

(* changed spans
(3,25)-(3,72)
(3,35)-(3,45)
*)

(* type error slice
(3,25)-(3,46)
(3,26)-(3,34)
(3,35)-(3,45)
*)
