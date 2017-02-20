
let rec digitsOfInt n =
  let numL = [] in if n > 0 then ((digitsOfInt n) mod 10) :: numL else numL;;


(* fix

let rec digitsOfInt n =
  let numL = [] in if n > 0 then (n mod 10) :: numL else numL;;

*)

(* changed spans
(3,34)-(3,49)
(3,35)-(3,46)
*)

(* type error slice
(2,3)-(3,77)
(2,20)-(3,75)
(3,2)-(3,75)
(3,19)-(3,75)
(3,33)-(3,57)
(3,33)-(3,65)
(3,34)-(3,49)
(3,35)-(3,46)
*)

(* all spans
(2,20)-(3,75)
(3,2)-(3,75)
(3,13)-(3,15)
(3,19)-(3,75)
(3,22)-(3,27)
(3,22)-(3,23)
(3,26)-(3,27)
(3,33)-(3,65)
(3,33)-(3,57)
(3,34)-(3,49)
(3,35)-(3,46)
(3,47)-(3,48)
(3,54)-(3,56)
(3,61)-(3,65)
(3,71)-(3,75)
*)
