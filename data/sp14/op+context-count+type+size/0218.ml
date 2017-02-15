
let rec clone x n =
  let rec clone_RT acc n =
    if n <= 0 then acc else clone_RT (x :: acc) (n - 1) in
  clone_RT [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let diff = len1 - len2 in
  if diff < 0
  then List.append ((List.append ((clone 0 (- diff)), len1)), len2)
  else List.append ((List.append ((clone 0 diff), len2)), len1);;


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
(12,7)-(12,18)
(12,7)-(12,67)
(12,20)-(12,60)
(12,33)-(12,59)
(12,54)-(12,58)
(12,62)-(12,66)
(13,7)-(13,18)
(13,7)-(13,63)
(13,19)-(13,63)
(13,20)-(13,56)
(13,33)-(13,55)
(13,43)-(13,47)
(13,50)-(13,54)
(13,58)-(13,62)
*)

(* type error slice
(12,7)-(12,18)
(12,7)-(12,67)
(12,19)-(12,67)
(12,20)-(12,60)
(12,21)-(12,32)
(12,33)-(12,59)
(13,7)-(13,18)
(13,7)-(13,63)
(13,19)-(13,63)
(13,20)-(13,56)
(13,21)-(13,32)
(13,33)-(13,55)
*)
