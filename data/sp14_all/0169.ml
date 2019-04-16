
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
(6,28)-(6,46)
clone 0 (- diff)
AppG (fromList [UopG EmptyG,LitG])

*)

(* type error slice
(6,5)-(6,19)
(6,6)-(6,11)
(6,27)-(6,52)
(6,28)-(6,46)
(6,29)-(6,38)
(6,30)-(6,35)
(6,47)-(6,48)
*)
