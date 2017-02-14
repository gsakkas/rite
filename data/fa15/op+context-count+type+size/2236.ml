
let rec digitsOfInt n =
  let numL = [] in if n > 0 then ((digitsOfInt n) mod 10) :: numL else numL;;


(* fix

let rec digitsOfInt n =
  let numL = [] in if n > 0 then (n mod 10) :: (digitsOfInt n) else numL;;

*)

(* changed spans
(3,36)-(3,49)
(3,55)-(3,57)
(3,72)-(3,76)
*)

(* type error slice
(2,4)-(3,78)
(2,21)-(3,76)
(3,3)-(3,76)
(3,20)-(3,76)
(3,36)-(3,47)
(3,36)-(3,49)
(3,36)-(3,57)
(3,36)-(3,66)
*)
