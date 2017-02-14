
let rec digitsOfInt n =
  let return = [] in
  if n <= 0 then [] :: return else (n mod 10) :: return;
  (digitsOfInt 0) @ return;;


(* fix

let rec digitsOfInt n =
  let return = [] in
  if n <= 0 then return else (n mod 10) :: return; (digitsOfInt 0) @ return;;

*)

(* changed spans
(4,17)-(4,19)
(4,17)-(4,29)
*)

(* type error slice
(4,2)-(4,55)
(4,2)-(5,26)
(4,17)-(4,19)
(4,17)-(4,29)
(4,17)-(4,29)
(4,17)-(4,29)
(4,23)-(4,29)
(4,35)-(4,45)
(4,35)-(4,55)
(4,35)-(4,55)
(4,49)-(4,55)
*)
