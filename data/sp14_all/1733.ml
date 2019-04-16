
let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) @ [digitsOfInt (n / 10)];;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else (let digit = digitsOfInt (n / 10) in digit @ [n mod 10]);;

*)

(* changed spans
(3,26)-(3,61)
let digit =
  digitsOfInt (n / 10) in
digit @ [n mod 10]
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (AppG (fromList [EmptyG]))

*)

(* type error slice
(3,26)-(3,36)
(3,26)-(3,61)
(3,37)-(3,38)
*)
