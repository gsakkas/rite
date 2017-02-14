
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
(10,13)-(10,74)
(10,26)-(10,74)
*)

(* type error slice
(3,45)-(3,65)
(3,51)-(3,56)
(3,51)-(3,65)
(6,3)-(10,74)
(6,3)-(10,74)
(8,9)-(8,76)
(8,74)-(8,76)
(10,8)-(10,74)
(10,13)-(10,24)
(10,13)-(10,74)
(10,26)-(10,31)
(10,26)-(10,74)
(10,55)-(10,66)
(10,55)-(10,69)
(10,67)-(10,69)
*)
