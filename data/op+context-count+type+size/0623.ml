
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
    then ((clone 0 ((List.length l2) - (List.length l1))) @ [l1]) :: l2;;



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


(* changed spans
(10,3)-(10,5)
(11,3)-(11,7)
(11,11)-(11,13)
(11,65)-(11,66)
(11,68)-(11,69)
(12,3)-(13,23)
(13,25)-(13,26)
(13,28)-(14,9)
(14,61)-(14,62)
(14,64)-(14,65)
(14,67)-(14,69)
*)

(* type error slice
(10,7)-(10,21)
*)
