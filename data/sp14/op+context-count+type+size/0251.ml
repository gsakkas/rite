
let rec clone x n =
  let rec clone_RT acc n =
    if n <= 0 then acc else clone_RT (x :: acc) (n - 1) in
  clone_RT [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let diff = len1 - len2 in
  if diff < 0
  then ((List.append ((clone 0 (- diff)), len1)), len2)
  else ((List.append ((clone 0 diff), len2)), len1);;


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
(12,8)-(12,48)
(12,21)-(12,47)
(12,42)-(12,46)
(12,50)-(12,54)
(13,7)-(13,51)
(13,8)-(13,44)
(13,21)-(13,43)
(13,38)-(13,42)
(13,46)-(13,50)
*)

(* type error slice
(12,8)-(12,48)
(12,9)-(12,20)
(12,21)-(12,47)
(13,8)-(13,44)
(13,9)-(13,20)
(13,21)-(13,43)
*)
