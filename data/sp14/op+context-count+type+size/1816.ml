
let padZero l1 l2 =
  if (List.length l1) = (List.length l2) then List.combine l1 l2;;


(* fix

let padZero l1 l2 =
  if (List.length l1) = (List.length l2) then (l1, l2) else (l1, l2);;

*)

(* changed spans
(3,3)-(3,65)
(3,47)-(3,59)
(3,47)-(3,65)
*)

(* type error slice
(3,3)-(3,65)
(3,3)-(3,65)
(3,3)-(3,65)
(3,47)-(3,59)
(3,47)-(3,65)
*)
