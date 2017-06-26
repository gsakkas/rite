
let rec digitsOfInt n =
  let return = [] in if n < 0 then return else digitsOfInt - 1;;


(* fix

let rec digitsOfInt n =
  let return = [] in if n < 0 then return else digitsOfInt 1;;

*)

(* changed spans
(3,47)-(3,62)
*)

(* type error slice
(3,2)-(3,62)
(3,15)-(3,17)
(3,21)-(3,62)
(3,35)-(3,41)
(3,47)-(3,62)
*)

(* all spans
(2,20)-(3,62)
(3,2)-(3,62)
(3,15)-(3,17)
(3,21)-(3,62)
(3,24)-(3,29)
(3,24)-(3,25)
(3,28)-(3,29)
(3,35)-(3,41)
(3,47)-(3,62)
(3,47)-(3,58)
(3,61)-(3,62)
*)
