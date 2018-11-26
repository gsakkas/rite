
let rec digitsOfInt n =
  let myList = [] in if n <= 0 then ([] mod 10) :: myList;;


(* fix

let rec digitsOfInt n = let myList = [] in if n <= 0 then [] else [];;

*)

(* changed spans
(3,21)-(3,57)
[]
ListG EmptyG Nothing

*)
