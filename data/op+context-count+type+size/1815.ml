
let padZero l1 l2 = if (List.length l1) = (List.length l2) then (l1, l2);;


(* fix

let padZero l1 l2 =
  if (List.length l1) = (List.length l2) then (l1, l2) else (l1, l2);;

*)

(* changed spans
(2,21)-(2,72)
*)

(* type error slice
(2,21)-(2,72)
(2,21)-(2,72)
(2,21)-(2,72)
(2,66)-(2,72)
*)
