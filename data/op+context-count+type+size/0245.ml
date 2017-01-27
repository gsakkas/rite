
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
(2,4)-(5,18)
(2,15)-(5,16)
(2,17)-(5,16)
(3,3)-(5,16)
(4,29)-(4,37)
(4,29)-(4,55)
(4,39)-(4,47)
(4,50)-(4,55)
(5,3)-(5,11)
(5,3)-(5,16)
(5,12)-(5,14)
(5,15)-(5,16)
(8,3)-(12,67)
(8,14)-(8,25)
(8,14)-(8,28)
(8,26)-(8,28)
(9,3)-(12,67)
(9,14)-(9,25)
(9,14)-(9,28)
(9,26)-(9,28)
(12,8)-(12,19)
(12,8)-(12,67)
(12,22)-(12,33)
(12,22)-(12,59)
(12,22)-(12,67)
(12,36)-(12,41)
(12,36)-(12,51)
(12,36)-(12,59)
(12,42)-(12,43)
(12,55)-(12,59)
(12,63)-(12,67)
*)
