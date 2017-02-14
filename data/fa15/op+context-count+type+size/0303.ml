
let rec digitsOfInt n =
  if n <= 0 then [] else (List.rev (n mod 10)) :: (digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else List.rev ((n mod 10) :: (digitsOfInt (n / 10)));;

*)

(* changed spans
(3,27)-(3,71)
(3,37)-(3,45)
*)

(* type error slice
(3,27)-(3,35)
(3,27)-(3,45)
(3,37)-(3,45)
*)
