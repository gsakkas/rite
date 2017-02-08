
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), (((clone 0) - diff) @ l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

*)

(* changed spans
(6,30)-(6,37)
(6,30)-(6,45)
(6,41)-(6,45)
*)

(* type error slice
(6,6)-(6,11)
(6,6)-(6,18)
(6,30)-(6,35)
(6,30)-(6,37)
(6,30)-(6,45)
(6,30)-(6,45)
(6,30)-(6,51)
(6,47)-(6,48)
*)
