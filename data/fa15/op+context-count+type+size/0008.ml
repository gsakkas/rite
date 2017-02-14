
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let d = (List.length l1) - (List.length l2) in
  if d < 0 then (clone 0 (0 - d)) @ (l1 * l2) else (l1 * (clone 0 d)) @ l2;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let d = (List.length l1) - (List.length l2) in
  if d < 0 then (((clone 0 (0 - d)) @ l1), l2) else (l1, ((clone 0 d) @ l2));;

*)

(* changed spans
(6,18)-(6,45)
(6,38)-(6,45)
(6,53)-(6,55)
(6,53)-(6,68)
(6,53)-(6,75)
*)

(* type error slice
(5,12)-(5,23)
(5,12)-(5,26)
(5,24)-(5,26)
(5,31)-(5,42)
(5,31)-(5,45)
(5,43)-(5,45)
(6,18)-(6,23)
(6,18)-(6,32)
(6,18)-(6,45)
(6,35)-(6,36)
(6,38)-(6,40)
(6,38)-(6,45)
(6,38)-(6,45)
(6,38)-(6,45)
(6,43)-(6,45)
(6,53)-(6,55)
(6,53)-(6,68)
(6,53)-(6,68)
(6,53)-(6,68)
(6,53)-(6,75)
(6,59)-(6,64)
(6,59)-(6,68)
(6,71)-(6,72)
*)
