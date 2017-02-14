
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
(12,41)-(12,45)
(12,48)-(12,52)
(13,10)-(13,48)
(13,37)-(13,41)
(13,44)-(13,48)
*)

(* type error slice
(8,3)-(13,48)
(8,14)-(8,25)
(8,14)-(8,28)
(9,3)-(13,48)
(9,14)-(9,25)
(9,14)-(9,28)
(12,10)-(12,21)
(12,10)-(12,45)
(12,41)-(12,45)
(13,10)-(13,21)
(13,10)-(13,41)
(13,37)-(13,41)
*)
