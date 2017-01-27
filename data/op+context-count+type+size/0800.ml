
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
(2,50)-(2,55)
(2,50)-(2,64)
(2,56)-(2,57)
(2,59)-(2,64)
(5,15)-(5,26)
(5,15)-(5,29)
(5,27)-(5,29)
(6,30)-(6,35)
(6,30)-(6,37)
(6,30)-(6,45)
(6,30)-(6,51)
(6,36)-(6,37)
(6,47)-(6,48)
(6,49)-(6,51)
*)
