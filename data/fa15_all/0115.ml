
let rec digitsOfInt n =
  let return = [] in
  if n <> 0
  then ((n mod 10) :: return; (digitsOfInt (n / 10)) @ return; print_int n)
  else return;;


(* fix

let rec digitsOfInt n =
  let return = [] in
  if n <> 0
  then ((n mod 10) :: return; print_int n; (digitsOfInt (n / 10)) @ return)
  else return;;

*)

(* changed spans
(5,30)-(5,61)
print_int
VarG

(5,30)-(5,61)
n
VarG

(5,30)-(5,61)
print_int n
AppG (fromList [VarG])

*)
