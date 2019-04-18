
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
(5,8)-(5,70)
match n with
| 0 -> [0]
| _ -> digitsOfInt (n / 10) @ [n mod 10]
CaseG (fromList [(LitPatG,Nothing,ListG (fromList [EmptyG])),(WildPatG,Nothing,AppG (fromList [EmptyG]))])

(5,43)-(5,45)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

(5,48)-(5,69)
[n mod 10]
ListG (fromList [BopG EmptyG EmptyG])

*)

(* type error slice
(3,6)-(3,7)
(3,6)-(3,11)
(3,10)-(3,11)
(5,8)-(5,70)
(5,15)-(5,16)
*)
