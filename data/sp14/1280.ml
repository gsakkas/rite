
let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | hd::tl -> hd :: (digitsOfInt tl));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [] @ [n mod 10]);;

*)

(* changed spans
(3,26)-(3,75)
match n with
| n -> [] @ [n mod 10]
CaseG VarG [(VarPatG,Nothing,AppG [EmptyG,EmptyG])]

*)

(* type error slice
(3,6)-(3,7)
(3,6)-(3,12)
(3,11)-(3,12)
(3,26)-(3,75)
(3,33)-(3,34)
*)
