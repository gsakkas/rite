
let rec digitsOfInt n =
  let return = [] in
  if n <= 0 then [return] else (n mod 10) :: return; (digitsOfInt 0) @ return;;


(* fix

let rec digitsOfInt n =
  let return = [] in
  if n <= 0 then return else (n mod 10) :: return; (digitsOfInt 0) @ return;;

*)

(* changed spans
(4,18)-(4,26)
*)

(* type error slice
(4,3)-(4,52)
(4,3)-(4,52)
(4,3)-(4,78)
(4,18)-(4,26)
(4,18)-(4,26)
(4,19)-(4,25)
(4,33)-(4,52)
(4,33)-(4,52)
(4,46)-(4,52)
*)
