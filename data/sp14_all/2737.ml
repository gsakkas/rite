
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let a = (List.length l1) - (List.length l2) in
  if a > 0
  then (l1, (List.append (clone 0 a) l2))
  else ((List.append (clone 0 (0 - a))), l2);;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let a = (List.length l1) - (List.length l2) in
  if a > 0
  then (l1, (List.append (clone 0 a) l2))
  else ((List.append (clone 0 (0 - a)) l1), l2);;

*)

(* changed spans
(8,9)-(8,40)
List.append (clone 0 (0 - a))
            l1
AppG [AppG [EmptyG,EmptyG],VarG]

*)

(* type error slice
(5,11)-(5,27)
(5,12)-(5,23)
(5,24)-(5,26)
(6,3)-(8,45)
(7,8)-(7,42)
(7,9)-(7,11)
(8,8)-(8,45)
(8,9)-(8,40)
(8,10)-(8,21)
*)
