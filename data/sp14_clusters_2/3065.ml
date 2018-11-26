
let rec digitsOfInt n = match n with | 0 -> [] | n -> [(digitsOfInt n) / 10];;


(* fix

let rec digitsOfInt n =
  match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(2,24)-(2,76)
match n with
| 0 -> []
| _ -> digitsOfInt (n / 10) @ [n mod 10]
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG Nothing)])

(2,55)-(2,70)
(@)
VarG

(2,55)-(2,75)
digitsOfInt (n / 10) @ [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(2,68)-(2,69)
n / 10
BopG VarG LitG

*)
