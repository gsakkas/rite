
let padZero l1 l2 =
  if (List.length l1) = (List.length l2) then List.combine l1 l2;;


(* fix

let padZero l1 l2 =
  if (List.length l1) = (List.length l2) then (l1, l2) else (l1, l2);;

*)

(* changed spans
(3,2)-(3,64)
(3,46)-(3,58)
(3,46)-(3,64)
*)

(* type error slice
(3,2)-(3,64)
(3,2)-(3,64)
(3,2)-(3,64)
(3,46)-(3,58)
(3,46)-(3,64)
*)
