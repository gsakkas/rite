
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
(8,23)-(8,38)
(8,23)-(8,43)
(8,32)-(8,35)
(8,49)-(8,64)
(8,49)-(8,69)
(8,58)-(8,61)
*)

(* type error slice
(3,59)-(3,76)
(3,60)-(3,65)
(3,68)-(3,75)
(6,2)-(8,69)
(6,2)-(8,69)
(7,9)-(7,17)
(8,9)-(8,69)
(8,23)-(8,38)
(8,24)-(8,29)
(8,32)-(8,35)
(8,49)-(8,64)
(8,49)-(8,69)
(8,50)-(8,55)
(8,58)-(8,61)
(8,65)-(8,66)
*)
