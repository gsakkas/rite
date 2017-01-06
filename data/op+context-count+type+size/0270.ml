
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


(* changed spans
(12,23)-(12,24)
(12,41)-(12,48)
(12,51)-(12,55)
(13,23)-(13,24)
(13,37)-(13,44)
(13,47)-(13,51)
*)

(* type error slice
(8,14)-(8,28)
*)
