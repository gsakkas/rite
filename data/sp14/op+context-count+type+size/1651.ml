
let rec digitsOfInt n =
  let myList = [] in
  if n <= 0 then [] else ((n mod 10) :: myList) :: digitsOfInt;;


(* fix

let rec digitsOfInt n =
  let myList = [] in if n <= 0 then [] else (n mod 10) :: myList;;

*)

(* changed spans
(4,28)-(4,47)
(4,52)-(4,63)
*)

(* type error slice
(2,4)-(4,65)
(2,21)-(4,63)
(4,28)-(4,63)
(4,52)-(4,63)
*)
