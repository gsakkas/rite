
let rec clone x n =
  match n with | y when y <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) <= (List.length l2) with
  | true  ->
      ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  | false  ->
      (l1, (List.append (clone 0 ((List.length l1) - (List.length l2)) l2)));;


(* fix

let rec clone x n =
  match n with | y when y <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) <= (List.length l2) with
  | true  ->
      ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  | false  ->
      (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

*)

(* changed spans
(10,11)-(10,75)
(10,24)-(10,74)
*)

(* type error slice
(3,44)-(3,66)
(3,49)-(3,66)
(3,50)-(3,55)
(6,2)-(10,76)
(6,2)-(10,76)
(8,6)-(8,76)
(8,73)-(8,75)
(10,6)-(10,76)
(10,11)-(10,75)
(10,12)-(10,23)
(10,24)-(10,74)
(10,25)-(10,30)
(10,53)-(10,69)
(10,54)-(10,65)
(10,66)-(10,68)
*)
