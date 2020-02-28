
let rec digitsOfInt n =
  let return = [] in
  if n <= 0 then return else (n mod 10) :: return; (n /. 10) :: return;;


(* fix

let rec digitsOfInt n =
  let return = [] in
  if n <= 0 then return else (n mod 10) :: return; (n / 10) :: return;;

*)

(* changed spans
(4,52)-(4,61)
n / 10
BopG VarG LitG

*)

(* type error slice
(4,6)-(4,7)
(4,6)-(4,12)
(4,11)-(4,12)
(4,30)-(4,40)
(4,30)-(4,50)
(4,44)-(4,50)
(4,52)-(4,61)
(4,52)-(4,71)
(4,53)-(4,54)
(4,58)-(4,60)
(4,65)-(4,71)
*)
