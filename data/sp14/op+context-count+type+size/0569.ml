
let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x (abs n);;

let padZero l1 l2 =
  match (List.length l1) > (List.length l2) with
  | true  ->
      (l1,
        (List.append ((clone 0 ((List.length l1) - (List.length l2))) l2)))
  | false  ->
      ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;


(* fix

let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x (abs n);;

let padZero l1 l2 =
  match (List.length l1) > (List.length l2) with
  | true  ->
      (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  | false  ->
      ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

*)

(* changed spans
(13,10)-(13,73)
(13,24)-(13,73)
*)

(* type error slice
(2,4)-(7,26)
(2,15)-(7,23)
(2,17)-(7,23)
(3,3)-(7,23)
(6,17)-(6,46)
(6,24)-(6,35)
(6,24)-(6,46)
(7,3)-(7,14)
(7,3)-(7,23)
(13,24)-(13,29)
(13,24)-(13,67)
(13,24)-(13,73)
(15,9)-(15,20)
(15,9)-(15,71)
(15,22)-(15,27)
(15,22)-(15,65)
*)
