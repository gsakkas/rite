
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) :: (n mod 10);;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else (let digits = digitsOfInt (n / 10) in digits @ [n mod 10]);;

*)

(* changed spans
(3,26)-(3,62)
let digits =
  digitsOfInt (n / 10) in
digits @ [n mod 10]
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (AppG (fromList [EmptyG]))

*)

(* type error slice
(2,4)-(3,64)
(2,21)-(3,62)
(3,3)-(3,62)
(3,26)-(3,48)
(3,26)-(3,62)
(3,27)-(3,38)
(3,52)-(3,62)
*)
