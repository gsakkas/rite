
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
