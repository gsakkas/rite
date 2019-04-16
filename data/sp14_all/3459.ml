
let rec digitsOfInt n = if n <= 0 then [] else [n mod 10; digitsOfInt n];;


(* fix

let rec digitsOfInt n =
  let myList = [] in if n <= 0 then [] else (n mod 10) :: myList;;

*)

(* changed spans
(2,25)-(2,73)
let myList = [] in
if n <= 0
then []
else (n mod 10) :: myList
LetG NonRec (fromList [(VarPatG,ListG (fromList []))]) (IteG EmptyG EmptyG EmptyG)

*)

(* type error slice
(2,4)-(2,75)
(2,21)-(2,73)
(2,25)-(2,73)
(2,48)-(2,73)
(2,59)-(2,70)
(2,59)-(2,72)
*)
