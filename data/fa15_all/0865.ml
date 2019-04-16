
let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n ->
      if n < 0
      then (((clone 0 (n * (-1))) @ l1), l2)
      else List.rev (((clone 0 n) @ l2), l1);;


(* fix

let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n ->
      if n < 0
      then (((clone 0 (n * (-1))) @ l1), l2)
      else (l1, ((clone 0 n) @ l2));;

*)

(* changed spans
(11,12)-(11,45)
(l1 , clone 0 n @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* type error slice
(11,12)-(11,20)
(11,12)-(11,45)
(11,21)-(11,45)
*)
