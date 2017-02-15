
let rec digitsOfInt n =
  let myList = [] in
  if n <= 0 then [] else n = (n - (n mod 10)); (n :: myList) :: digitsOfInt;;


(* fix

let rec digitsOfInt n =
  let myList = [] in if n <= 0 then [] else (n mod 10) :: myList;;

*)

(* changed spans
(4,2)-(4,75)
(4,25)-(4,26)
(4,25)-(4,45)
(4,29)-(4,45)
(4,30)-(4,31)
(4,34)-(4,44)
(4,41)-(4,43)
*)

(* type error slice
(4,2)-(4,45)
(4,2)-(4,45)
(4,2)-(4,75)
(4,17)-(4,19)
(4,25)-(4,45)
*)
