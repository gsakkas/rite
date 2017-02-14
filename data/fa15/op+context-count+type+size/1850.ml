
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
(10,16)-(10,23)
(10,16)-(10,28)
(10,27)-(10,28)
(10,32)-(10,34)
*)

(* type error slice
(3,61)-(3,66)
(3,61)-(3,75)
(10,16)-(10,21)
(10,16)-(10,23)
(10,16)-(10,28)
(10,16)-(10,28)
(10,16)-(10,34)
(10,30)-(10,31)
*)
