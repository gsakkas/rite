
let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x (abs n);;

let padZero l1 l2 =
  match (List.length l1) > (List.length l2) with
  | true  -> l1 :: ((clone 0 ((List.length l1) - (List.length l2))) @ l2)
  | false  -> ((clone 0 ((List.length l2) - (List.length l1))) @ [l1]) :: l2;;


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
(11,13)-(11,73)
(12,14)-(12,76)
(12,65)-(12,69)
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
(11,13)-(11,15)
(11,13)-(11,73)
(11,13)-(11,73)
(11,19)-(11,73)
(11,20)-(11,67)
(11,21)-(11,26)
(11,27)-(11,28)
(11,30)-(11,46)
(11,31)-(11,42)
(11,43)-(11,45)
(11,68)-(11,69)
(11,70)-(11,72)
(12,14)-(12,70)
(12,14)-(12,76)
(12,14)-(12,76)
(12,15)-(12,62)
(12,16)-(12,21)
(12,44)-(12,60)
(12,45)-(12,56)
(12,57)-(12,59)
(12,63)-(12,64)
(12,65)-(12,69)
(12,65)-(12,69)
(12,66)-(12,68)
(12,74)-(12,76)
*)
