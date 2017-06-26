
let rec digitsOfInt n =
  let return = [] in
  if n <= 0 then [return] else (n mod 10) :: return; (digitsOfInt 0) @ return;;


(* fix

let rec digitsOfInt n =
  let return = [] in
  if n <= 0 then return else (n mod 10) :: return; (digitsOfInt 0) @ return;;

*)

(* changed spans
(4,17)-(4,25)
*)

(* type error slice
(4,2)-(4,51)
(4,17)-(4,25)
(4,18)-(4,24)
(4,31)-(4,51)
(4,45)-(4,51)
*)

(* all spans
(2,20)-(4,77)
(3,2)-(4,77)
(3,15)-(3,17)
(4,2)-(4,77)
(4,2)-(4,51)
(4,5)-(4,11)
(4,5)-(4,6)
(4,10)-(4,11)
(4,17)-(4,25)
(4,18)-(4,24)
(4,31)-(4,51)
(4,31)-(4,41)
(4,32)-(4,33)
(4,38)-(4,40)
(4,45)-(4,51)
(4,53)-(4,77)
(4,69)-(4,70)
(4,53)-(4,68)
(4,54)-(4,65)
(4,66)-(4,67)
(4,71)-(4,77)
*)
