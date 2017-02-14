
let rec clone x n =
  let rec clone_RT acc n =
    if n <= 0 then acc else clone_RT (x :: acc) (n - 1) in
  clone_RT [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let diff = len1 - len2 in
  if diff < 0
  then List.append ((List.append ((clone 0 (- diff)), len1)), len2);;


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
(11,3)-(12,67)
(12,8)-(12,19)
(12,8)-(12,67)
(12,22)-(12,59)
(12,36)-(12,59)
(12,55)-(12,59)
(12,63)-(12,67)
*)

(* type error slice
(12,8)-(12,19)
(12,8)-(12,67)
(12,22)-(12,33)
(12,22)-(12,59)
(12,22)-(12,67)
(12,36)-(12,59)
*)
