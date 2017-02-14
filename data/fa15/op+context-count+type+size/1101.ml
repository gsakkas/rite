
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else
      if (List.length l2) < (List.length l1)
      then (clone 0 ((List.length l1) - (List.length l2))) @ l2;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

*)

(* changed spans
(11,7)-(12,64)
(11,11)-(11,22)
(11,11)-(11,25)
(11,11)-(11,44)
(11,23)-(11,25)
(11,30)-(11,41)
(11,30)-(11,44)
(12,62)-(12,64)
*)

(* type error slice
(8,5)-(12,64)
(8,5)-(12,64)
(9,13)-(9,69)
(11,7)-(12,64)
(11,7)-(12,64)
(11,7)-(12,64)
(12,13)-(12,64)
(12,60)-(12,61)
*)
