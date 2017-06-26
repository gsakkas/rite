
let rec digitsOfInt n =
  let return = [] in if n < 0 then return else return :: 1;;


(* fix

let rec digitsOfInt n =
  let return = [] in if n < 0 then return else 1 :: return;;

*)

(* changed spans
(3,47)-(3,53)
*)

(* type error slice
(3,21)-(3,58)
(3,35)-(3,41)
(3,47)-(3,53)
(3,47)-(3,58)
(3,57)-(3,58)
*)

(* all spans
(2,20)-(3,58)
(3,2)-(3,58)
(3,15)-(3,17)
(3,21)-(3,58)
(3,24)-(3,29)
(3,24)-(3,25)
(3,28)-(3,29)
(3,35)-(3,41)
(3,47)-(3,58)
(3,47)-(3,53)
(3,57)-(3,58)
*)
