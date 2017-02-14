
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
(4,2)-(4,51)
(4,2)-(4,77)
(4,17)-(4,25)
(4,17)-(4,25)
(4,18)-(4,24)
(4,31)-(4,51)
(4,31)-(4,51)
(4,45)-(4,51)
*)
