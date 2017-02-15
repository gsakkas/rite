
let rec clone x n = if n > 0 then [x] @ (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (clone 0 (len1 - l2)) @ l2
  else (clone 0 (len2 - len1)) @ l1;;


(* fix

let rec clone x n = if n > 0 then [x] @ (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

*)

(* changed spans
(8,7)-(8,33)
(8,24)-(8,26)
(9,7)-(9,35)
*)

(* type error slice
(6,13)-(6,24)
(6,13)-(6,27)
(6,25)-(6,27)
(8,16)-(8,27)
(8,24)-(8,26)
*)
