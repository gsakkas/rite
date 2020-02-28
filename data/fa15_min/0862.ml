
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
(10,14)-(10,29)
clone 0 (n * (-1))
AppG [LitG,BopG EmptyG EmptyG]

*)

(* type error slice
(3,60)-(3,77)
(3,61)-(3,66)
(10,13)-(10,35)
(10,14)-(10,29)
(10,15)-(10,24)
(10,16)-(10,21)
(10,30)-(10,31)
*)
