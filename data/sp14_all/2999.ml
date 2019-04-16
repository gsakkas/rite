
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff >= 0
  then (l1, ((clone 0 diff) @ l2))
  else (((clone 0 abs diff) @ l1), l2);;


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
(2,49)-(2,66)
(2,50)-(2,55)
(2,58)-(2,65)
(8,10)-(8,28)
(8,11)-(8,16)
(8,19)-(8,22)
*)
