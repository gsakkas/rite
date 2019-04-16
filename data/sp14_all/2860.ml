
let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n = 0
    then [0]
    else if (List.length ((digitsOfInt (n / 10)) @ [n mod 10])) = 0 then [];;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else if n = 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(7,10)-(7,13)
[]
ListG (fromList [])

(8,10)-(8,76)
digitsOfInt (n / 10) @ [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])

*)

(* type error slice
(8,10)-(8,76)
(8,74)-(8,76)
(8,76)-(8,76)
*)
