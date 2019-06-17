
let rec digitsOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with
       | false  -> n :: (digitsOfInt (n / 10))
       | true  -> 1 :: 1);;


(* fix

let rec digitsOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with
       | false  -> n :: (digitsOfInt (n / 10))
       | true  -> [1]);;

*)

(* changed spans
(8,19)-(8,25)
[1]
ListG [LitG]

*)

(* type error slice
(8,19)-(8,25)
(8,24)-(8,25)
*)
