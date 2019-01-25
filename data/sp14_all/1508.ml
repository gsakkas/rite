
let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x (abs n);;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then l1 :: ((clone 0 ((List.length l1) - (List.length l2))) @ l2)
  else
    if (List.length l1) < (List.length l2)
    then l2 :: ((clone 0 ((List.length l2) - (List.length l1))) @ l1);;


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
(10,2)-(14,69)
match List.length l1 > List.length l2 with
| true -> (l1 , clone 0
                      (List.length l1 - List.length l2) @ l2)
| false -> (clone 0
                  (List.length l2 - List.length l1) @ l1 , l2)
CaseG (BopG EmptyG EmptyG) (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(11,7)-(11,67)
(l1 , clone 0
            (List.length l1 - List.length l2) @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(13,4)-(14,69)
l2
VarG

(14,9)-(14,11)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)