
let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x (abs n);;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then l1 :: ((clone 0 ((List.length l1) - (List.length l2))) @ l2)
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
(11,7)-(11,67)
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
(2,3)-(7,25)
(2,14)-(7,23)
(2,16)-(7,23)
(3,2)-(7,23)
(6,16)-(6,18)
(6,16)-(6,47)
(6,16)-(6,47)
(6,22)-(6,47)
(6,23)-(6,34)
(6,35)-(6,37)
(7,2)-(7,13)
(7,2)-(7,23)
(7,14)-(7,15)
(11,7)-(11,9)
(11,7)-(11,67)
(11,7)-(11,67)
(11,13)-(11,67)
(11,14)-(11,61)
(11,15)-(11,20)
(11,21)-(11,22)
(11,24)-(11,40)
(11,25)-(11,36)
(11,37)-(11,39)
(11,62)-(11,63)
(13,4)-(14,61)
(13,4)-(14,61)
(13,4)-(14,61)
(14,9)-(14,56)
(14,9)-(14,61)
(14,10)-(14,15)
(14,57)-(14,58)
(14,59)-(14,61)
*)
