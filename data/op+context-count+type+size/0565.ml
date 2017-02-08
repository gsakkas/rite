
let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x (abs n);;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then l1 :: ((clone 0 ((List.length l1) - (List.length l2))) @ [l2])
  else
    if (List.length l1) < (List.length l2)
    then l2 :: ((clone 0 ((List.length l2) - (List.length l1))) @ [l1]);;


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
(10,3)-(14,71)
(11,8)-(11,69)
(11,65)-(11,69)
(13,5)-(14,71)
(13,9)-(13,20)
(13,9)-(13,23)
(13,9)-(13,42)
(13,21)-(13,23)
(13,28)-(13,39)
(13,28)-(13,42)
(13,40)-(13,42)
(14,10)-(14,12)
(14,10)-(14,71)
(14,67)-(14,71)
*)

(* type error slice
(2,4)-(7,26)
(2,15)-(7,23)
(2,17)-(7,23)
(3,3)-(7,23)
(6,17)-(6,19)
(6,17)-(6,46)
(6,17)-(6,46)
(6,24)-(6,35)
(6,24)-(6,46)
(6,36)-(6,38)
(7,3)-(7,14)
(7,3)-(7,23)
(7,15)-(7,16)
(11,16)-(11,21)
(11,16)-(11,59)
(11,16)-(11,69)
(11,22)-(11,23)
(11,45)-(11,56)
(11,45)-(11,59)
(11,57)-(11,59)
(11,63)-(11,64)
(11,65)-(11,69)
(11,65)-(11,69)
(11,66)-(11,68)
(13,5)-(14,71)
(13,5)-(14,71)
(13,5)-(14,71)
(14,10)-(14,71)
(14,18)-(14,23)
(14,18)-(14,61)
(14,18)-(14,71)
(14,47)-(14,58)
(14,47)-(14,61)
(14,59)-(14,61)
(14,65)-(14,66)
(14,67)-(14,71)
(14,67)-(14,71)
(14,68)-(14,70)
*)
