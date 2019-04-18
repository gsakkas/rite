
let rec digitsOfInt n =
  let myList = [] in if n <= 0 then [] else (n mod 10) @ myList;;


(* fix

let rec digitsOfInt n =
  let myList = [] in if n <= 0 then [] else (n mod 10) :: myList;;

*)

(* changed spans
(3,45)-(3,64)
(n mod 10) :: myList
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)

(* type error slice
(3,45)-(3,55)
(3,45)-(3,64)
(3,56)-(3,57)
*)
