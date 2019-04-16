
let rec digitsOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with
       | false  -> n :: (digitsOfInt (n / 10))
       | true  -> 1 :: 2);;


(* fix

let rec digitsOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with
       | false  -> n :: (digitsOfInt (n / 10))
       | true  -> (n mod 10) :: (digitsOfInt (n / 10)));;

*)

(* changed spans
(8,19)-(8,20)
n mod 10
BopG VarG LitG

(8,24)-(8,25)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* type error slice
(8,19)-(8,25)
(8,24)-(8,25)
*)
