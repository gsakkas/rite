
let rec clone x n =
  if n < 1 then [] else (match n with | _ -> [x] @ (clone x (n - 1)));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else if s1 > s2 then (l1, (clone 0 (s1 - s2))) else clone 0 (s2 - s1);;


(* fix

let rec clone x n =
  if n < 1 then [] else (match n with | _ -> [x] @ (clone x (n - 1)));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2 then (l1, (clone 0 (s1 - s2))) else ((clone 0 (s2 - s1)), l2);;

*)

(* changed spans
(10,54)-(10,71)
*)

(* type error slice
(10,7)-(10,71)
(10,7)-(10,71)
(10,23)-(10,48)
(10,28)-(10,47)
(10,29)-(10,34)
(10,54)-(10,59)
(10,54)-(10,71)
*)
