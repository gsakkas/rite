
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
(8,9)-(8,34)
(8,25)-(8,27)
(9,9)-(9,36)
*)

(* type error slice
(6,14)-(6,25)
(6,14)-(6,28)
(6,26)-(6,28)
(8,18)-(8,27)
(8,25)-(8,27)
*)
