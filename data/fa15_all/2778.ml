
let rec clone x n = if n > 0 then [x] @ (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, (clone 0 (len1 - len2))) @ l2
  else (((clone 0 (len2 - len1)) @ l1), l2);;


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
(8,8)-(8,42)
(l1 , clone 0
            (len1 - len2) @ l2)
TupleG [VarG,AppG [EmptyG,EmptyG]]

*)

(* type error slice
(8,8)-(8,37)
(8,8)-(8,42)
(8,38)-(8,39)
*)
