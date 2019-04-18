
let rec digitsOfInt n =
  let myList = [] in if n <= 0 then ([] mod 10) :: myList;;


(* fix

let rec digitsOfInt n =
  let myList = [] in if n <= 0 then [] else (n mod 10) :: myList;;

*)

(* changed spans
(3,37)-(3,58)
[]
ListG (fromList [])

(3,58)-(3,58)
(n mod 10) :: myList
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)

(* type error slice
(3,22)-(3,58)
(3,37)-(3,48)
(3,37)-(3,58)
(3,38)-(3,40)
(3,58)-(3,58)
*)
