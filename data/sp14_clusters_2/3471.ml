
let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (List.rev digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (List.rev (digitsOfInt (n / 10)));;

*)

(* changed spans
(3,39)-(3,70)
List.rev (digitsOfInt (n / 10))
AppG (fromList [AppG (fromList [EmptyG])])

(3,49)-(3,60)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)
