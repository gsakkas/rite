
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff >= 0
  then (l1, ((clone 0 diff) @ l2))
  else ((((clone 0) - diff) @ l1), l2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff >= 0
  then (l1, ((clone 0 diff) @ l2))
  else (((clone 0 (abs diff)) @ l1), l2);;

*)

(* changed spans
(8,10)-(8,28)
clone 0 (abs diff)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* type error slice
(7,14)-(7,28)
(7,15)-(7,20)
(8,9)-(8,34)
(8,10)-(8,28)
(8,11)-(8,20)
(8,12)-(8,17)
(8,29)-(8,30)
*)
