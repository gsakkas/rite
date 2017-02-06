
let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [] :: (n mod 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [] @ [n mod 10]);;

*)

(* changed spans
(3,47)-(3,49)
(3,47)-(3,62)
(3,54)-(3,62)
*)

(* type error slice
(2,4)-(3,66)
(2,21)-(3,62)
(3,3)-(3,62)
(3,3)-(3,62)
(3,6)-(3,7)
(3,6)-(3,12)
(3,18)-(3,20)
(3,27)-(3,62)
(3,47)-(3,49)
(3,47)-(3,62)
(3,54)-(3,55)
(3,54)-(3,62)
(3,54)-(3,62)
(3,60)-(3,62)
*)
