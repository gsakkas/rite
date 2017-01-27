
let rec digitsOfInt n =
  let myList = [] in if n <= 0 then [] else (n mod 10) @ myList;;


(* fix

let rec digitsOfInt n =
  let myList = [] in if n <= 0 then [] else (n mod 10) :: myList;;

*)

(* changed spans
(3,46)-(3,64)
(3,56)-(3,57)
*)

(* type error slice
(3,3)-(3,64)
(3,16)-(3,18)
(3,46)-(3,54)
(3,46)-(3,64)
(3,56)-(3,57)
(3,58)-(3,64)
*)
