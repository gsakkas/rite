
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
(12,67)-(12,71)
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
(11,21)-(11,26)
(11,21)-(11,64)
(11,27)-(11,28)
(12,18)-(12,23)
(12,18)-(12,61)
(12,18)-(12,71)
(12,47)-(12,58)
(12,47)-(12,61)
(12,59)-(12,61)
(12,65)-(12,66)
(12,67)-(12,71)
(12,67)-(12,71)
(12,68)-(12,70)
*)
