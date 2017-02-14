
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
(8,25)-(8,40)
(8,36)-(8,37)
(8,47)-(8,62)
(8,58)-(8,59)
*)

(* type error slice
(3,55)-(3,75)
(3,61)-(3,66)
(3,61)-(3,75)
(8,25)-(8,30)
(8,25)-(8,34)
(8,25)-(8,40)
(8,36)-(8,37)
(8,47)-(8,52)
(8,47)-(8,56)
(8,47)-(8,62)
(8,58)-(8,59)
*)
