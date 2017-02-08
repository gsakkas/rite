
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
(10,3)-(14,72)
(11,8)-(11,69)
(11,11)-(11,12)
(11,13)-(11,69)
(11,64)-(11,68)
(13,5)-(14,72)
(13,9)-(13,20)
(13,9)-(13,23)
(13,9)-(13,42)
(13,21)-(13,23)
(13,28)-(13,39)
(13,28)-(13,42)
(13,40)-(13,42)
(14,12)-(14,72)
(14,61)-(14,65)
(14,70)-(14,72)
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
(11,15)-(11,20)
(11,15)-(11,58)
(11,15)-(11,68)
(11,21)-(11,22)
(11,44)-(11,55)
(11,44)-(11,58)
(11,56)-(11,58)
(11,62)-(11,63)
(11,64)-(11,68)
(11,64)-(11,68)
(11,65)-(11,67)
(13,5)-(14,72)
(13,5)-(14,72)
(13,5)-(14,72)
(14,12)-(14,17)
(14,12)-(14,55)
(14,12)-(14,65)
(14,12)-(14,72)
(14,41)-(14,52)
(14,41)-(14,55)
(14,53)-(14,55)
(14,59)-(14,60)
(14,61)-(14,65)
(14,61)-(14,65)
(14,62)-(14,64)
*)
