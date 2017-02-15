
let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n -> if n < 0 then (((clone 0 n) @ l1), l2);;


(* fix

let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n -> if n < 0 then (((clone 0 n) @ l1), l2) else (((clone 0 n) @ l2), l1);;

*)

(* changed spans
(8,9)-(8,47)
*)

(* type error slice
(8,9)-(8,47)
(8,9)-(8,47)
(8,9)-(8,47)
(8,23)-(8,47)
*)
