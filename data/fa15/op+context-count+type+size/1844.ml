
let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n -> if n < 0 then (clone 0 n) ^ l1 else (clone 0 n) ^ l2;;


(* fix

let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n -> if n < 0 then (((clone 0 n) @ l1), l2) else (((clone 0 n) @ l2), l1);;

*)

(* changed spans
(8,23)-(8,39)
(8,35)-(8,36)
(8,45)-(8,61)
(8,57)-(8,58)
*)

(* type error slice
(3,54)-(3,76)
(3,59)-(3,76)
(3,60)-(3,65)
(8,23)-(8,34)
(8,23)-(8,39)
(8,24)-(8,29)
(8,35)-(8,36)
(8,45)-(8,56)
(8,45)-(8,61)
(8,46)-(8,51)
(8,57)-(8,58)
*)
