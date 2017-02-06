
let rec digitsOfInt n = if n <= 0 then [] else [n mod 10; digitsOfInt n];;


(* fix

let rec digitsOfInt n =
  let myList = [] in if n <= 0 then [] else (n mod 10) :: myList;;

*)

(* changed spans
(2,25)-(2,73)
(2,48)-(2,73)
(2,59)-(2,70)
(2,59)-(2,72)
(2,71)-(2,72)
*)

(* type error slice
(2,21)-(2,73)
(2,25)-(2,73)
(2,28)-(2,29)
(2,28)-(2,34)
(2,40)-(2,42)
(2,59)-(2,70)
(2,59)-(2,72)
*)
