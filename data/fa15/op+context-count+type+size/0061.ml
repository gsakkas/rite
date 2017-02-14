
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
(4,18)-(4,20)
(4,18)-(4,30)
*)

(* type error slice
(4,3)-(4,56)
(4,3)-(5,27)
(4,18)-(4,20)
(4,18)-(4,30)
(4,18)-(4,30)
(4,18)-(4,30)
(4,24)-(4,30)
(4,37)-(4,45)
(4,37)-(4,56)
(4,37)-(4,56)
(4,50)-(4,56)
*)
