
let rec digitsOfInt n =
  let return = [] in
  if n < 0 then return else (n mod 10) :: ((return digitsOfInt n) / 10);;


(* fix

let rec digitsOfInt n =
  let return = [] in if n < 0 then return else digitsOfInt 1;;

*)

(* changed spans
(4,44)-(4,50)
digitsOfInt 1
AppG (fromList [LitG])

(4,68)-(4,70)
1
LitG

*)
