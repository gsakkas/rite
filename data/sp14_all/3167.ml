
let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then
    List.append [(clone 0 ((List.length l2) - (List.length l1))) @ l1] [l2]
  else
    (List.length l2) <
      ((List.length l1) List.append [l1]
         [(clone 0 ((List.length l1) - (List.length l2))) @ l2]);;


(* fix

let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

*)

(* changed spans
(10,5)-(10,76)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG [AppG [EmptyG,EmptyG],VarG]

(12,5)-(14,65)
(l1 , clone 0
            (List.length l1 - List.length l2) @ l2)
TupleG [VarG,AppG [EmptyG,EmptyG]]

*)

(* type error slice
(8,3)-(14,65)
(10,5)-(10,16)
(10,5)-(10,76)
(12,5)-(14,65)
(13,7)-(14,65)
(13,8)-(13,24)
(13,9)-(13,20)
*)
