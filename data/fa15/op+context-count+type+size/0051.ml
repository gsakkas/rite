
let rec digitsOfInt n =
  let return = [] in
  if n == 0 then return else (n mod 10) :: return; (digitsOfInt 0) :: return;;


(* fix

let rec digitsOfInt n =
  let return = [] in
  if n == 0 then return else (n mod 10) :: return; (digitsOfInt 0) @ return;;

*)

(* changed spans
(4,51)-(4,66)
(4,51)-(4,76)
*)

(* type error slice
(2,3)-(4,78)
(2,20)-(4,76)
(3,2)-(4,76)
(4,2)-(4,49)
(4,2)-(4,76)
(4,2)-(4,76)
(4,17)-(4,23)
(4,29)-(4,49)
(4,43)-(4,49)
(4,51)-(4,66)
(4,51)-(4,76)
(4,51)-(4,76)
(4,52)-(4,63)
*)
