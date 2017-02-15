
let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n ->
      if n < 0
      then ((((clone 0) - n) @ l1), l2)
      else (((clone 0 n) @ l2), l1);;


(* fix

let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n ->
      if n < 0
      then (((clone 0 (n * (-1))) @ l1), l2)
      else (((clone 0 n) @ l2), l1);;

*)

(* changed spans
(10,13)-(10,28)
(10,14)-(10,23)
(10,26)-(10,27)
(10,31)-(10,33)
*)

(* type error slice
(3,59)-(3,76)
(3,60)-(3,65)
(10,12)-(10,34)
(10,13)-(10,28)
(10,13)-(10,28)
(10,14)-(10,23)
(10,15)-(10,20)
(10,29)-(10,30)
*)
