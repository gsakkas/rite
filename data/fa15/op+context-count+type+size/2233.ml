
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
