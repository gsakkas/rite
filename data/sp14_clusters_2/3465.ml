
let rec digitsOfInt n = let myList = [] in if n <= 0 then [];;


(* fix

let rec digitsOfInt n =
  let myList = [] in if n <= 0 then [] else (n mod 10) :: myList;;

*)

(* changed spans
(2,43)-(2,60)
(n mod 10) :: myList
ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG]))) Nothing

*)
