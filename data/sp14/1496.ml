
let rec digitsOfInt n =
  let myList = [] in if n <= 0 then [] else (n mod 10) @ myList;;


(* fix

let rec digitsOfInt n =
  let myList = [] in if n <= 0 then [] else (n mod 10) :: myList;;

*)

(* changed spans
(3,44)-(3,63)
(3,55)-(3,56)
*)

(* type error slice
(3,44)-(3,54)
(3,44)-(3,63)
(3,55)-(3,56)
*)

(* all spans
(2,20)-(3,63)
(3,2)-(3,63)
(3,15)-(3,17)
(3,21)-(3,63)
(3,24)-(3,30)
(3,24)-(3,25)
(3,29)-(3,30)
(3,36)-(3,38)
(3,44)-(3,63)
(3,55)-(3,56)
(3,44)-(3,54)
(3,45)-(3,46)
(3,51)-(3,53)
(3,57)-(3,63)
*)
