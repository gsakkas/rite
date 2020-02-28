
let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (List.rev digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (List.rev (digitsOfInt (n / 10)));;

*)

(* changed spans
(3,40)-(3,71)
List.rev (digitsOfInt (n / 10))
AppG [AppG [EmptyG]]

*)

(* type error slice
(3,40)-(3,71)
(3,41)-(3,49)
*)
