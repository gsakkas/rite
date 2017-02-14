
let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x (abs n);;

let padZero l1 l2 =
  match (List.length l1) > (List.length l2) with
  | true  -> (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  | false  -> (((clone 0 ((List.length l2) - (List.length l1))) @ [l1]), l2);;


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
(12,66)-(12,70)
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
(11,19)-(11,66)
(11,20)-(11,25)
(11,26)-(11,27)
(12,15)-(12,71)
(12,16)-(12,63)
(12,17)-(12,22)
(12,45)-(12,61)
(12,46)-(12,57)
(12,58)-(12,60)
(12,64)-(12,65)
(12,66)-(12,70)
(12,66)-(12,70)
(12,67)-(12,69)
*)
