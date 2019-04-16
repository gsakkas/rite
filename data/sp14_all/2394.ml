
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
(8,19)-(8,41)
n / 10
BopG VarG LitG

(8,45)-(8,55)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* type error slice
(2,4)-(8,58)
(2,21)-(8,56)
(3,3)-(8,56)
(6,7)-(8,56)
(8,19)-(8,41)
(8,19)-(8,55)
(8,20)-(8,31)
(8,45)-(8,55)
*)
