
let padZero l1 l2 = if (List.length l1) = (List.length l2) then l1 l2;;


(* fix

let padZero l1 l2 =
  if (List.length l1) = (List.length l2) then (l1, l2) else (l1, l2);;

*)

(* changed spans
(2,20)-(2,69)
(2,64)-(2,69)
*)

(* type error slice
(2,23)-(2,39)
(2,24)-(2,35)
(2,36)-(2,38)
(2,64)-(2,66)
(2,64)-(2,69)
*)
