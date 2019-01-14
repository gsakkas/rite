
let rec digitsOfInt n =
  let return = [] in
  if n <= 0 then return else (n mod 10) :: return; (n /. 10) :: return;;


(* fix

let rec digitsOfInt n =
  let return = [] in
  if n <= 0 then return else (n mod 10) :: return; (n / 10) :: return;;

*)

(* changed spans
(4,51)-(4,60)
n / 10
BopG VarG LitG

*)
