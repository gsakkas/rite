
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
(3,21)-(3,58)
(3,35)-(3,41)
(3,47)-(3,53)
(3,47)-(3,58)
(3,47)-(3,58)
(3,47)-(3,58)
(3,57)-(3,58)
*)
