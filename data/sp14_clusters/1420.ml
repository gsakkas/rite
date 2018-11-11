
let rec digitsOfInt n =
  match n with
  | [] -> []
  | 0 -> [0]
  | _ -> (digitsOfInt (n / 10)) @ (n mod 10);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [0] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;

*)

(* changed spans
(3,2)-(6,44)
if n < 0
then []
else (match n with
      | 0 -> [0]
      | _ -> digitsOfInt (n / 10) @ [n mod 10])
IteG (BopG EmptyG EmptyG) (ListG EmptyG Nothing) (CaseG EmptyG [(Nothing,EmptyG),(Nothing,EmptyG)])

(3,8)-(3,9)
n < 0
BopG VarG LitG

(4,10)-(4,12)
0
LitG

(5,9)-(5,12)
n
VarG

(5,9)-(5,12)
match n with
| 0 -> [0]
| _ -> digitsOfInt (n / 10) @ [n mod 10]
CaseG VarG [(Nothing,ListG EmptyG Nothing),(Nothing,AppG [EmptyG,EmptyG])]

(6,34)-(6,44)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
