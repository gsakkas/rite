
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
(11,6)-(12,63)
(11,9)-(11,25)
(11,9)-(11,44)
(11,10)-(11,21)
(11,22)-(11,24)
(11,28)-(11,44)
(11,29)-(11,40)
(12,61)-(12,63)
*)

(* type error slice
(8,4)-(12,63)
(8,4)-(12,63)
(9,9)-(9,69)
(11,6)-(12,63)
(11,6)-(12,63)
(11,6)-(12,63)
(12,11)-(12,63)
(12,59)-(12,60)
*)
