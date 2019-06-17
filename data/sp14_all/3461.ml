
let rec digitsOfInt n = let myList = [] in if n <= 0 then [];;


(* fix

let rec digitsOfInt n = let myList = [] in if n <= 0 then [] else [];;

*)

(* changed spans
(2,61)-(2,61)
[]
ListG []

*)

(* type error slice
(2,44)-(2,61)
(2,59)-(2,61)
(2,61)-(2,61)
*)
