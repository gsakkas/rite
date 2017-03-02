
let rec digitsOfInt n =
  let return = [] in
  if n <> 0 then (n mod 10) :: (return digitsOfInt 0) else return;;


(* fix

let rec digitsOfInt n =
  let return = [] in if n <> 0 then (n mod 10) :: return else return;;

*)

(* changed spans
(4,31)-(4,53)
(4,39)-(4,50)
(4,51)-(4,52)
*)

(* type error slice
(3,2)-(4,65)
(3,15)-(3,17)
(4,31)-(4,53)
(4,32)-(4,38)
*)

(* all spans
(2,20)-(4,65)
(3,2)-(4,65)
(3,15)-(3,17)
(4,2)-(4,65)
(4,5)-(4,11)
(4,5)-(4,6)
(4,10)-(4,11)
(4,17)-(4,53)
(4,17)-(4,27)
(4,18)-(4,19)
(4,24)-(4,26)
(4,31)-(4,53)
(4,32)-(4,38)
(4,39)-(4,50)
(4,51)-(4,52)
(4,59)-(4,65)
*)
