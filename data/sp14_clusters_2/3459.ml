
let rec digitsOfInt n = if n <= 0 then [] else [n mod 10; digitsOfInt n];;


(* fix

let rec digitsOfInt n =
  let myList = [] in if n <= 0 then [] else (n mod 10) :: myList;;

*)

(* changed spans
(2,24)-(2,72)
let myList = [] in
if n <= 0
then []
else (n mod 10) :: myList
LetG NonRec (fromList [ListG EmptyG Nothing]) (IteG EmptyG EmptyG EmptyG)

(2,24)-(2,72)
[]
ListG EmptyG Nothing

(2,47)-(2,72)
(n mod 10) :: myList
ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG]))) Nothing

(2,70)-(2,71)
myList
VarG

*)
