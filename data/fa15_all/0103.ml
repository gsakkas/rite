
let rec digitsOfInt n =
  let return = [] in
  if n < 0 then return else (n mod 10) :: ((return digitsOfInt n) /. 10);;


(* fix

let rec digitsOfInt n =
  let return = [] in if n < 0 then return else digitsOfInt 1;;

*)

(* changed spans
(4,29)-(4,73)
digitsOfInt 1
AppG (fromList [LitG])

*)

(* type error slice
(3,3)-(4,73)
(3,16)-(3,18)
(4,29)-(4,73)
(4,43)-(4,73)
(4,44)-(4,66)
(4,45)-(4,51)
(4,70)-(4,72)
*)
