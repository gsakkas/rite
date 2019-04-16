
let padZero l1 l2 =
  let length_diff = (List.length l1) - (List.length l2) in
  if length_diff < 0
  then length_diff = ((List.length l1) - (List.length l2))
  else length_diff;;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

*)

(* changed spans
(3,3)-(6,19)
if List.length l1 < List.length l2
then (List.append (clone 0
                         (List.length l2 - List.length l1))
                  l1 , l2)
else (l1 , List.append (clone 0
                              (List.length l1 - List.length l2))
                       l2)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

*)

(* type error slice
(3,3)-(6,19)
(3,21)-(3,56)
(4,3)-(6,19)
(5,8)-(5,59)
(6,8)-(6,19)
*)
