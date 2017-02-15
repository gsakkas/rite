
let rec digitsOfInt n =
  let return = [] in
  if n < 0 then return else (n mod 10) :: ((return digitsOfInt n) /. 10);;


(* fix

let rec digitsOfInt n =
  let return = [] in if n < 0 then return else digitsOfInt 1;;

*)

(* changed spans
(4,28)-(4,38)
(4,28)-(4,72)
(4,29)-(4,30)
(4,35)-(4,37)
(4,42)-(4,72)
(4,43)-(4,65)
*)

(* type error slice
(3,2)-(4,72)
(3,15)-(3,17)
(4,28)-(4,72)
(4,42)-(4,72)
(4,42)-(4,72)
(4,43)-(4,65)
(4,44)-(4,50)
(4,69)-(4,71)
*)
