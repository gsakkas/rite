
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
(6,75)-(6,76)
*)

(* type error slice
(6,6)-(6,77)
(6,6)-(6,77)
(6,36)-(6,63)
(6,75)-(6,76)
*)
