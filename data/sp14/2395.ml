
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
(6,36)-(6,63)
(6,75)-(6,76)
*)

(* all spans
(2,20)-(6,77)
(3,2)-(6,77)
(3,8)-(3,13)
(3,8)-(3,9)
(3,12)-(3,13)
(4,14)-(4,16)
(6,6)-(6,77)
(6,13)-(6,18)
(6,13)-(6,14)
(6,17)-(6,18)
(6,36)-(6,63)
(6,36)-(6,37)
(6,41)-(6,63)
(6,42)-(6,53)
(6,54)-(6,62)
(6,55)-(6,56)
(6,59)-(6,61)
(6,75)-(6,76)
*)
