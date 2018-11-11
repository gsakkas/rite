
let rec digitsOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with
       | false  -> [n]
       | true  -> (digitsOfInt (n / 10)) :: (n mod 10));;


(* fix

let rec digitsOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with
       | false  -> [n]
       | true  -> (n / 10) :: (digitsOfInt (n / 10)));;

*)

(* changed spans
(8,44)-(8,54)
digitsOfInt (n / 10)
AppG [BopG EmptyG EmptyG]

(8,45)-(8,46)
digitsOfInt
VarG

(8,45)-(8,46)
n / 10
BopG VarG LitG

*)
