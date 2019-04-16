
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
(10,12)-(10,76)
List.append (clone 0
                   (List.length l1 - List.length l2))
            l2
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* type error slice
(3,45)-(3,67)
(3,50)-(3,67)
(3,51)-(3,56)
(6,3)-(10,77)
(8,7)-(8,77)
(8,74)-(8,76)
(10,7)-(10,77)
(10,12)-(10,76)
(10,13)-(10,24)
(10,25)-(10,75)
(10,26)-(10,31)
(10,54)-(10,70)
(10,55)-(10,66)
(10,67)-(10,69)
*)
