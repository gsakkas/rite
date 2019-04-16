
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | _ -> (digitsOfInt (n / 10)) :: (n mod 10));;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;

*)

(* changed spans
(5,8)-(5,66)
match n with
| 0 -> []
| _ -> digitsOfInt (n / 10) @ [n mod 10]
CaseG VarG (fromList [(LitPatG,Nothing,ListG (fromList [])),(WildPatG,Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(2,4)-(5,68)
(2,21)-(5,66)
(3,3)-(5,66)
(5,8)-(5,66)
(5,29)-(5,51)
(5,29)-(5,65)
(5,30)-(5,41)
(5,55)-(5,65)
*)
