
let rec digitsOfInt n =
  let return = [] in
  if n < 0 then return else (digitsOfInt (-1) (n mod 10)) :: return;;


(* fix

let rec digitsOfInt n =
  let return = [] in if n < 0 then return else (n mod 10) :: return;;

*)

(* changed spans
(4,30)-(4,41)
(4,30)-(4,56)
(4,43)-(4,45)
*)

(* type error slice
(2,4)-(4,70)
(2,21)-(4,68)
(3,3)-(4,68)
(4,3)-(4,68)
(4,17)-(4,23)
(4,30)-(4,41)
(4,30)-(4,56)
(4,30)-(4,68)
(4,62)-(4,68)
*)
