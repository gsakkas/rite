
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
(6,28)-(6,37)
clone 0 (- diff)
AppG (fromList [UopG EmptyG,LitG])

(6,40)-(6,44)
(- diff)
UopG VarG

*)
