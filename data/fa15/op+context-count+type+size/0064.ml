
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
