
let rec clone x n =
  let rec clone_RT acc n =
    if n <= 0 then acc else clone_RT (x :: acc) (n - 1) in
  clone_RT [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let diff = len1 - len2 in
  if diff < 0
  then ((List.append (clone 0 (- diff)) len1), len2)
  else ((List.append (clone 0 diff) len2), len1);;


(* fix

let rec clone x n =
  let rec clone_RT acc n =
    if n <= 0 then acc else clone_RT (x :: acc) (n - 1) in
  clone_RT [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let diff = len1 - len2 in
  if diff < 0
  then ((List.append (clone 0 (- diff)) l1), l2)
  else ((List.append (clone 0 diff) l2), l1);;

*)

(* changed spans
(12,40)-(12,44)
(12,47)-(12,51)
(13,7)-(13,48)
(13,36)-(13,40)
(13,43)-(13,47)
*)

(* type error slice
(8,2)-(13,48)
(8,13)-(8,24)
(8,13)-(8,27)
(9,2)-(13,48)
(9,13)-(9,24)
(9,13)-(9,27)
(12,8)-(12,45)
(12,9)-(12,20)
(12,40)-(12,44)
(13,8)-(13,41)
(13,9)-(13,20)
(13,36)-(13,40)
*)
