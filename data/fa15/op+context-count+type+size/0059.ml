
let rec digitsOfInt n =
  let return = [] in
  if n == 0 then return else (n mod 10) :: return; (digitsOfInt 0) :: return;;


(* fix

let rec digitsOfInt n =
  let return = [] in
  if n == 0 then return else (n mod 10) :: return; (digitsOfInt 0) @ return;;

*)

(* changed spans
(4,53)-(4,66)
(4,53)-(4,77)
*)

(* type error slice
(2,4)-(4,79)
(2,21)-(4,77)
(3,3)-(4,77)
(4,3)-(4,50)
(4,3)-(4,77)
(4,3)-(4,77)
(4,18)-(4,24)
(4,31)-(4,50)
(4,44)-(4,50)
(4,53)-(4,64)
(4,53)-(4,66)
(4,53)-(4,77)
(4,53)-(4,77)
*)
