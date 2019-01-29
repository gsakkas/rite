
let rec digitsOfInt n =
  let myList = [] in if n <= 0 then [] else (n mod 10) @ myList;;


(* fix

let rec digitsOfInt n =
  let myList = [] in if n <= 0 then [] else (n mod 10) :: myList;;

*)

(* changed spans
(3,55)-(3,56)
(n mod 10) :: myList
ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG]))) Nothing

*)
