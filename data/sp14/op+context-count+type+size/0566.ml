
let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x (abs n);;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (clone 0 ((List.length l1) - (List.length l2))) @ l2
  else
    if (List.length l1) < (List.length l2)
    then (clone 0 ((List.length l2) - (List.length l1))) @ l1;;


(* fix

let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x (abs n);;

let padZero l1 l2 =
  match (List.length l1) > (List.length l2) with
  | true  -> (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  | false  -> (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

*)

(* changed spans
(10,2)-(14,61)
(11,7)-(11,59)
(13,4)-(14,61)
(13,7)-(13,23)
(13,7)-(13,42)
(13,8)-(13,19)
(13,20)-(13,22)
(13,26)-(13,42)
(13,27)-(13,38)
(13,39)-(13,41)
(14,59)-(14,61)
*)

(* type error slice
(13,4)-(14,61)
(13,4)-(14,61)
(13,4)-(14,61)
(14,9)-(14,61)
(14,57)-(14,58)
*)
