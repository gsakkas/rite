
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
