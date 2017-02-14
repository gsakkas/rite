
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
(8,18)-(8,40)
(8,19)-(8,30)
*)

(* type error slice
(8,18)-(8,40)
(8,18)-(8,68)
(8,18)-(8,68)
(8,19)-(8,30)
(8,44)-(8,68)
(8,45)-(8,56)
*)
