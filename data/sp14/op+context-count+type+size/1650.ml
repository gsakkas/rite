
let rec digitsOfInt n =
  let myList = [] in
  if n <= 0 then [] else n = (n - (n mod 10)); (n :: myList) :: digitsOfInt;;


(* fix

let rec digitsOfInt n =
  let myList = [] in if n <= 0 then [] else (n mod 10) :: myList;;

*)

(* changed spans
(4,3)-(4,76)
(4,26)-(4,27)
(4,26)-(4,44)
(4,31)-(4,32)
(4,31)-(4,44)
(4,36)-(4,44)
*)

(* type error slice
(4,3)-(4,44)
(4,3)-(4,44)
(4,3)-(4,76)
(4,18)-(4,20)
(4,26)-(4,44)
*)
