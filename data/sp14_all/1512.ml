
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
(11,14)-(11,74)
(l1 , clone 0
            (List.length l1 - List.length l2) @ l2)
TupleG [VarG,AppG [EmptyG,EmptyG]]

(12,15)-(12,77)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG [AppG [EmptyG,EmptyG],VarG]

*)

(* type error slice
(2,4)-(7,26)
(2,15)-(7,24)
(2,17)-(7,24)
(3,3)-(7,24)
(6,17)-(6,19)
(6,17)-(6,48)
(6,23)-(6,48)
(6,24)-(6,35)
(6,36)-(6,38)
(7,3)-(7,14)
(7,3)-(7,24)
(7,15)-(7,16)
(11,14)-(11,16)
(11,14)-(11,74)
(11,20)-(11,74)
(11,21)-(11,68)
(11,22)-(11,27)
(11,28)-(11,29)
(11,31)-(11,47)
(11,32)-(11,43)
(11,44)-(11,46)
(11,69)-(11,70)
(11,71)-(11,73)
(12,15)-(12,71)
(12,15)-(12,77)
(12,16)-(12,63)
(12,17)-(12,22)
(12,45)-(12,61)
(12,46)-(12,57)
(12,58)-(12,60)
(12,64)-(12,65)
(12,66)-(12,70)
(12,67)-(12,69)
(12,75)-(12,77)
*)
