
let rec digitsOfInt n =
  if n < 0 then [] else [digitsOfInt (n / 10) (n mod 10)];;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;

*)

(* changed spans
(3,25)-(3,58)
match n with
| 0 -> []
| _ -> digitsOfInt (n / 10) @ [n mod 10]
CaseG VarG [(LitPatG,Nothing,ListG []),(WildPatG,Nothing,AppG [EmptyG,EmptyG])]

*)

(* type error slice
(2,4)-(3,60)
(2,21)-(3,58)
(3,3)-(3,58)
(3,25)-(3,58)
(3,26)-(3,37)
(3,26)-(3,57)
*)
