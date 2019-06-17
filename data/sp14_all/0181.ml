
let rec clone x n = failwith "to be implemented";;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

*)

(* changed spans
(2,21)-(2,49)
if n > 0
then x :: (clone x (n - 1))
else []
IteG (BopG EmptyG EmptyG) (AppG [EmptyG,EmptyG]) (ListG [])

(6,78)-(6,78)
(List.append (clone 0
                    (List.length l2 - List.length l1))
             l1 , l2)
TupleG [AppG [EmptyG,EmptyG],VarG]

*)

(* type error slice
(5,3)-(6,78)
(6,8)-(6,78)
(6,78)-(6,78)
*)
