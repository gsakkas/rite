
let padZero l1 l2 = if (List.length l1) = (List.length l2) then l1 l2;;


(* fix

let padZero l1 l2 =
  if (List.length l1) = (List.length l2) then (l1, l2) else (l1, l2);;

*)

(* changed spans
(2,21)-(2,70)
(2,65)-(2,70)
*)

(* type error slice
(2,25)-(2,36)
(2,25)-(2,39)
(2,37)-(2,39)
(2,65)-(2,67)
(2,65)-(2,70)
*)
