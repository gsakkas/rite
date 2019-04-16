
let rec digitsOfInt n = if n <= 0 then [] else [digitsOfInt (n / 10)];;


(* fix

let rec digitsOfInt n =
  let myList = [] in
  if n <= 0
  then []
  else if n < 10 then [n] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(2,25)-(2,70)
let myList = [] in
if n <= 0
then []
else if n < 10
     then [n]
     else digitsOfInt (n / 10) @ [n mod 10]
LetG NonRec (fromList [(VarPatG,ListG (fromList []))]) (IteG EmptyG EmptyG EmptyG)

*)

(* type error slice
(2,4)-(2,72)
(2,21)-(2,70)
(2,25)-(2,70)
(2,48)-(2,70)
(2,49)-(2,60)
(2,49)-(2,69)
*)
