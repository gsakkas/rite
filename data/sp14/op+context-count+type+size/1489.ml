
let rec digitsOfInt n =
  let myList = [] in
  if n <= 0 then [] else ((n mod 10) :: myList) :: digitsOfInt;;


(* fix

let rec digitsOfInt n =
  let myList = [] in if n <= 0 then [] else (n mod 10) :: myList;;

*)

(* changed spans
(4,25)-(4,47)
(4,51)-(4,62)
*)

(* type error slice
(2,3)-(4,64)
(2,20)-(4,62)
(4,25)-(4,62)
(4,51)-(4,62)
*)

(* all spans
(2,20)-(4,62)
(3,2)-(4,62)
(3,15)-(3,17)
(4,2)-(4,62)
(4,5)-(4,11)
(4,5)-(4,6)
(4,10)-(4,11)
(4,17)-(4,19)
(4,25)-(4,62)
(4,25)-(4,47)
(4,26)-(4,36)
(4,27)-(4,28)
(4,33)-(4,35)
(4,40)-(4,46)
(4,51)-(4,62)
*)
