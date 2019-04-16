
let rec digitsOfInt n = match n with | 0 -> [] | n -> [digitsOfInt n];;


(* fix

let rec digitsOfInt n =
  match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(2,25)-(2,70)
match n with
| 0 -> []
| _ -> digitsOfInt (n / 10) @ [n mod 10]
CaseG VarG (fromList [(LitPatG,Nothing,ListG (fromList [])),(WildPatG,Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(2,4)-(2,72)
(2,21)-(2,70)
(2,25)-(2,70)
(2,55)-(2,70)
(2,56)-(2,67)
(2,56)-(2,69)
*)
