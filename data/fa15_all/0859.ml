
let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n -> if n < 0 then (clone 0 abs n) @ l1 else (clone 0 abs n) @ l2;;


(* fix

let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n -> if n < 0 then (((clone 0 n) @ l1), l2) else (((clone 0 n) @ l2), l1);;

*)

(* changed spans
(8,24)-(8,44)
(clone 0 n @ l1 , l2)
TupleG [AppG [EmptyG,EmptyG],VarG]

(8,50)-(8,70)
(clone 0 n @ l2 , l1)
TupleG [AppG [EmptyG,EmptyG],VarG]

*)

(* type error slice
(3,60)-(3,77)
(3,61)-(3,66)
(3,69)-(3,76)
(6,3)-(8,70)
(7,10)-(7,18)
(8,10)-(8,70)
(8,24)-(8,39)
(8,25)-(8,30)
(8,33)-(8,36)
(8,50)-(8,65)
(8,50)-(8,70)
(8,51)-(8,56)
(8,59)-(8,62)
(8,66)-(8,67)
*)
