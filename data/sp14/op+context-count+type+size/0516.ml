
let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x (abs n);;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then l1 @ [(clone 0 ((List.length l1) - (List.length l2))) @ [l2]]
  else
    if (List.length l1) < (List.length l2)
    then ((clone 0 ((List.length l2) - (List.length l1))) @ [l1]) :: l2;;


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
(10,2)-(14,71)
(11,7)-(11,68)
(11,10)-(11,11)
(11,12)-(11,68)
(11,63)-(11,67)
(13,4)-(14,71)
(13,7)-(13,23)
(13,7)-(13,42)
(13,8)-(13,19)
(13,20)-(13,22)
(13,26)-(13,42)
(13,27)-(13,38)
(13,39)-(13,41)
(14,9)-(14,71)
(14,21)-(14,32)
(14,39)-(14,55)
(14,60)-(14,64)
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
(11,13)-(11,60)
(11,13)-(11,67)
(11,14)-(11,19)
(11,20)-(11,21)
(11,42)-(11,58)
(11,43)-(11,54)
(11,55)-(11,57)
(11,61)-(11,62)
(11,63)-(11,67)
(11,63)-(11,67)
(11,64)-(11,66)
(13,4)-(14,71)
(13,4)-(14,71)
(13,4)-(14,71)
(14,9)-(14,65)
(14,9)-(14,71)
(14,10)-(14,57)
(14,11)-(14,16)
(14,39)-(14,55)
(14,40)-(14,51)
(14,52)-(14,54)
(14,58)-(14,59)
(14,60)-(14,64)
(14,60)-(14,64)
(14,61)-(14,63)
*)
