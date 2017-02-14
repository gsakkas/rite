
let rec digitsOfInt n =
  let return = [] in
  if n < 0 then return else (n mod 10) :: ((return digitsOfInt n) / 10);;


(* fix

let rec digitsOfInt n =
  let return = [] in if n < 0 then return else digitsOfInt 1;;

*)

(* changed spans
(4,30)-(4,31)
(4,30)-(4,38)
(4,30)-(4,71)
(4,36)-(4,38)
(4,45)-(4,71)
*)

(* type error slice
(3,3)-(4,71)
(3,16)-(3,18)
(4,30)-(4,71)
(4,45)-(4,51)
(4,45)-(4,65)
(4,45)-(4,71)
*)
