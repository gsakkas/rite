
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
(10,3)-(14,62)
(11,9)-(11,60)
(13,5)-(14,62)
(13,9)-(13,20)
(13,9)-(13,23)
(13,9)-(13,42)
(13,21)-(13,23)
(13,28)-(13,39)
(13,28)-(13,42)
(13,40)-(13,42)
(14,60)-(14,62)
*)

(* type error slice
(13,5)-(14,62)
(13,5)-(14,62)
(13,5)-(14,62)
(14,11)-(14,62)
(14,58)-(14,59)
*)
