
let rec digitsOfInt n =
  let numL = [] in if n > 0 then (n mod 10) :: (numL digitsOfInt n) else numL;;


(* fix

let rec digitsOfInt n =
  let numL = [] in if n > 0 then (n mod 10) :: (digitsOfInt n) else numL;;

*)

(* changed spans
(3,49)-(3,53)
(3,49)-(3,67)
*)

(* type error slice
(3,3)-(3,78)
(3,14)-(3,16)
(3,49)-(3,53)
(3,49)-(3,67)
*)
