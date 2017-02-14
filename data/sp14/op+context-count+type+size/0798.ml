
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
(6,27)-(6,45)
(6,28)-(6,37)
(6,40)-(6,44)
*)

(* type error slice
(6,4)-(6,18)
(6,5)-(6,10)
(6,26)-(6,51)
(6,27)-(6,45)
(6,27)-(6,45)
(6,28)-(6,37)
(6,29)-(6,34)
(6,46)-(6,47)
*)
