
let rec digitsOfInt n = if n <= 0 then [] else [n mod 10; digitsOfInt n];;


(* fix

let rec digitsOfInt n =
  let myList = [] in if n <= 0 then [] else (n mod 10) :: myList;;

*)

(* changed spans
(2,24)-(2,72)
(2,47)-(2,72)
(2,58)-(2,69)
(2,58)-(2,71)
(2,70)-(2,71)
*)

(* type error slice
(2,3)-(2,74)
(2,20)-(2,72)
(2,24)-(2,72)
(2,47)-(2,72)
(2,47)-(2,72)
(2,58)-(2,69)
(2,58)-(2,71)
*)
