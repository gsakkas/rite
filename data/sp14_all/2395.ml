
let rec digitsOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with | false  -> n :: (digitsOfInt (n / 10)) | true  -> 1);;


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
(6,76)-(6,77)
[1]
ListG (fromList [LitG])

*)

(* type error slice
(6,7)-(6,78)
(6,37)-(6,64)
(6,76)-(6,77)
*)
