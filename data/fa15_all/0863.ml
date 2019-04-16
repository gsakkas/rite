
let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n ->
      if n < 0
      then (((clone 0 abs n) @ l1), l2)
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
AppG (fromList [BopG EmptyG EmptyG,LitG])

*)

(* type error slice
(3,60)-(3,77)
(3,61)-(3,66)
(3,69)-(3,76)
(10,14)-(10,29)
(10,15)-(10,20)
(10,23)-(10,26)
*)
