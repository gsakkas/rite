
let rec digitsOfInt n =
  if n < 0 then [] else [digitsOfInt (n / 10); n mod 10];;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;

*)

(* changed spans
(3,25)-(3,57)
match n with
| 0 -> []
| _ -> digitsOfInt (n / 10) @ [n mod 10]
CaseG VarG (fromList [(LitPatG,Nothing,ListG (fromList [])),(WildPatG,Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(2,4)-(3,59)
(2,21)-(3,57)
(3,3)-(3,57)
(3,25)-(3,57)
(3,26)-(3,37)
(3,26)-(3,46)
*)
