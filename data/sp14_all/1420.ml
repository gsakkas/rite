
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
(3,3)-(6,45)
if n < 0
then []
else (match n with
      | 0 -> [0]
      | _ -> digitsOfInt (n / 10) @ [n mod 10])
IteG (BopG EmptyG EmptyG) (ListG (fromList [])) (CaseG EmptyG (fromList [(LitPatG,Nothing,EmptyG),(WildPatG,Nothing,EmptyG)]))

*)

(* type error slice
(3,3)-(6,45)
(3,9)-(3,10)
(6,10)-(6,45)
(6,23)-(6,31)
(6,24)-(6,25)
(6,33)-(6,34)
(6,35)-(6,45)
*)
