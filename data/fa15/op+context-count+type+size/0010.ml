
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let d = (List.length l1) - (List.length l2) in
  if d < 0 then ((clone 0 (0 - d)) @ l1) * l2 else (l1 * (clone 0 d)) @ l2;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let d = (List.length l1) - (List.length l2) in
  if d < 0 then (((clone 0 (0 - d)) @ l1), l2) else (l1, ((clone 0 d) @ l2));;

*)

(* changed spans
(6,19)-(6,46)
(6,53)-(6,55)
(6,53)-(6,68)
(6,53)-(6,75)
*)

(* type error slice
(2,44)-(2,64)
(2,50)-(2,55)
(2,50)-(2,64)
(5,31)-(5,42)
(5,31)-(5,45)
(5,43)-(5,45)
(6,19)-(6,40)
(6,19)-(6,46)
(6,19)-(6,46)
(6,36)-(6,37)
(6,38)-(6,40)
(6,44)-(6,46)
(6,53)-(6,55)
(6,53)-(6,68)
(6,53)-(6,68)
(6,53)-(6,68)
(6,53)-(6,75)
(6,59)-(6,64)
(6,59)-(6,68)
(6,71)-(6,72)
*)
