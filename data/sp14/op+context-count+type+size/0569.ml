
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
(13,8)-(13,74)
(13,21)-(13,73)
*)

(* type error slice
(2,3)-(7,25)
(2,14)-(7,23)
(2,16)-(7,23)
(3,2)-(7,23)
(6,16)-(6,47)
(6,22)-(6,47)
(6,23)-(6,34)
(7,2)-(7,13)
(7,2)-(7,23)
(13,21)-(13,73)
(13,22)-(13,69)
(13,23)-(13,28)
(15,7)-(15,71)
(15,8)-(15,19)
(15,20)-(15,67)
(15,21)-(15,26)
*)
