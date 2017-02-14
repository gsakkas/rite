
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
(6,16)-(6,45)
(6,36)-(6,45)
(6,51)-(6,69)
(6,51)-(6,74)
(6,52)-(6,54)
*)

(* type error slice
(5,10)-(5,26)
(5,11)-(5,22)
(5,23)-(5,25)
(5,29)-(5,45)
(5,30)-(5,41)
(5,42)-(5,44)
(6,16)-(6,33)
(6,16)-(6,45)
(6,17)-(6,22)
(6,34)-(6,35)
(6,36)-(6,45)
(6,36)-(6,45)
(6,36)-(6,45)
(6,37)-(6,39)
(6,42)-(6,44)
(6,51)-(6,69)
(6,51)-(6,69)
(6,51)-(6,69)
(6,51)-(6,74)
(6,52)-(6,54)
(6,57)-(6,68)
(6,58)-(6,63)
(6,70)-(6,71)
*)
