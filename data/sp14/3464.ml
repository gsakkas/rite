
let rec digitsOfInt n =
  let myList = [] in if n <= 0 then ([] mod 10) :: myList;;


(* fix

let rec digitsOfInt n =
  let myList = [] in if n <= 0 then [] else (n mod 10) :: myList;;

*)

(* changed spans
(3,21)-(3,57)
(3,36)-(3,57)
(3,37)-(3,39)
*)

(* type error slice
(3,21)-(3,57)
(3,36)-(3,47)
(3,36)-(3,57)
(3,37)-(3,39)
*)

(* all spans
(2,20)-(3,57)
(3,2)-(3,57)
(3,15)-(3,17)
(3,21)-(3,57)
(3,24)-(3,30)
(3,24)-(3,25)
(3,29)-(3,30)
(3,36)-(3,57)
(3,36)-(3,47)
(3,37)-(3,39)
(3,44)-(3,46)
(3,51)-(3,57)
*)
