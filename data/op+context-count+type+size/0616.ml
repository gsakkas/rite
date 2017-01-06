
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
(11,17)-(11,19)
(12,66)-(12,67)
(12,69)-(12,70)
(12,72)-(12,74)
*)

(* type error slice
(10,10)-(10,24)
*)
