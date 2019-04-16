
let rec digitsOfInt n =
  let return = [] in
  if n < 0 then return else (digitsOfInt (-1) (n mod 10)) :: return;;


(* fix

let rec digitsOfInt n =
  let return = [] in if n < 0 then return else (n mod 10) :: return;;

*)

(* changed spans
(4,29)-(4,58)
n mod 10
BopG VarG LitG

*)

(* type error slice
(2,4)-(4,70)
(2,21)-(4,68)
(3,3)-(4,68)
(4,3)-(4,68)
(4,29)-(4,58)
(4,29)-(4,68)
(4,30)-(4,41)
*)
