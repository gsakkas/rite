
let rec digitsOfInt n = let myList = [] in if n <= 0 then [];;


(* fix

let rec digitsOfInt n =
  let myList = [] in if n <= 0 then [] else (n mod 10) :: myList;;

*)

(* changed spans
(2,43)-(2,60)
*)

(* type error slice
(2,43)-(2,60)
(2,58)-(2,60)
*)

(* all spans
(2,20)-(2,60)
(2,24)-(2,60)
(2,37)-(2,39)
(2,43)-(2,60)
(2,46)-(2,52)
(2,46)-(2,47)
(2,51)-(2,52)
(2,58)-(2,60)
*)
