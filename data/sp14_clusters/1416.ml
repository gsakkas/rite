
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [0] | h::t -> [] @ (h @ (digitsOfInt t)));;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [0] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;

*)

(* changed spans
(5,7)-(5,69)
match n with
| 0 -> [0]
| _ -> digitsOfInt (n / 10) @ [n mod 10]
CaseG VarG [(Nothing,ListG EmptyG Nothing),(Nothing,AppG [EmptyG,EmptyG])]

(5,65)-(5,66)
n / 10
BopG VarG LitG

*)
