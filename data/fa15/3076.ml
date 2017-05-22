
let rec digitsOfInt n =
  let numL = [] in if n > 0 then (n mod 10) :: (numL digitsOfInt n) else numL;;


(* fix

let rec digitsOfInt n =
  let numL = [] in if n > 0 then (n mod 10) :: (digitsOfInt n) else numL;;

*)

(* changed spans
(3,47)-(3,67)
(3,48)-(3,52)
*)

(* type error slice
(3,2)-(3,77)
(3,13)-(3,15)
(3,47)-(3,67)
(3,48)-(3,52)
*)

(* all spans
(2,20)-(3,77)
(3,2)-(3,77)
(3,13)-(3,15)
(3,19)-(3,77)
(3,22)-(3,27)
(3,22)-(3,23)
(3,26)-(3,27)
(3,33)-(3,67)
(3,33)-(3,43)
(3,34)-(3,35)
(3,40)-(3,42)
(3,47)-(3,67)
(3,48)-(3,52)
(3,53)-(3,64)
(3,65)-(3,66)
(3,73)-(3,77)
*)
