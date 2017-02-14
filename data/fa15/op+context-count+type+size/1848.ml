
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
(8,25)-(8,38)
(8,25)-(8,44)
(8,33)-(8,36)
(8,51)-(8,64)
(8,51)-(8,70)
(8,59)-(8,62)
*)

(* type error slice
(3,61)-(3,66)
(3,61)-(3,75)
(3,70)-(3,75)
(6,3)-(8,70)
(6,3)-(8,70)
(7,11)-(7,17)
(8,10)-(8,70)
(8,25)-(8,30)
(8,25)-(8,38)
(8,33)-(8,36)
(8,51)-(8,56)
(8,51)-(8,64)
(8,51)-(8,70)
(8,59)-(8,62)
(8,66)-(8,67)
*)
