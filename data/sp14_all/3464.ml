
let rec digitsOfInt n =
  let myList = [] in if n <= 0 then ([] mod 10) :: myList;;


(* fix

let rec digitsOfInt n =
  let myList = [] in if n <= 0 then [] else (n mod 10) :: myList;;

*)

(* changed spans
(3,36)-(3,57)
[]
ListG EmptyG Nothing

(3,37)-(3,39)
n
VarG

*)
