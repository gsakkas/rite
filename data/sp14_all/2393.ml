
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
(8,19)-(8,41)
n / 10
BopG VarG LitG

*)

(* type error slice
(8,19)-(8,41)
(8,19)-(8,69)
(8,20)-(8,31)
(8,45)-(8,69)
(8,46)-(8,57)
*)
