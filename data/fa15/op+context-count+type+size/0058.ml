
let rec digitsOfInt n =
  let return = [] in
  if n <= 0 then return else (n mod 10) :: return; (n /. 10) :: return;;


(* fix

let rec digitsOfInt n =
  let return = [] in
  if n <= 0 then return else (n mod 10) :: return; (n / 10) :: return;;

*)

(* changed spans
(4,53)-(4,60)
*)

(* type error slice
(4,3)-(4,50)
(4,3)-(4,71)
(4,6)-(4,7)
(4,6)-(4,12)
(4,6)-(4,12)
(4,11)-(4,12)
(4,18)-(4,24)
(4,31)-(4,39)
(4,31)-(4,50)
(4,31)-(4,50)
(4,44)-(4,50)
(4,53)-(4,54)
(4,53)-(4,60)
(4,53)-(4,60)
(4,53)-(4,60)
(4,53)-(4,71)
(4,53)-(4,71)
(4,58)-(4,60)
(4,65)-(4,71)
*)
