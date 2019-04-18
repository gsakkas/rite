
let rec digitsOfInt n = let myList = [] in if n <= 0 then [];;


(* fix

let rec digitsOfInt n =
  let myList = [] in if n <= 0 then [] else (n mod 10) :: myList;;

*)

(* changed spans
(2,61)-(2,61)
(n mod 10) :: myList
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)

(* type error slice
(2,44)-(2,61)
(2,59)-(2,61)
(2,61)-(2,61)
*)
