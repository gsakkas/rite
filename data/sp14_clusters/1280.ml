
let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | hd::tl -> hd :: (digitsOfInt tl));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [] @ [n mod 10]);;

*)

(* changed spans
(3,25)-(3,74)
match n with
| n -> [] @ [n mod 10]
CaseG VarG [(Nothing,AppG [EmptyG,EmptyG])]

(3,70)-(3,72)
[] @ [n mod 10]
AppG [ListG EmptyG Nothing,ListG EmptyG Nothing]

*)
