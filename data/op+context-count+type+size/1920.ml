
let rec digitsOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with
       | false  -> [n]
       | true  -> (digitsOfInt (n / 10)) :: (digitsOfInt (n mod 10)));;


(* fix

let rec digitsOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with
       | false  -> [n]
       | true  -> (n / 10) :: (digitsOfInt (n mod 10)));;

*)

(* changed spans
(8,20)-(8,31)
(8,20)-(8,39)
*)

(* type error slice
(8,20)-(8,31)
(8,20)-(8,39)
(8,20)-(8,67)
(8,20)-(8,67)
(8,46)-(8,57)
(8,46)-(8,67)
*)
