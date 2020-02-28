
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
(12,9)-(12,49)
List.append (clone 0 (- diff))
            l1
AppG [AppG [EmptyG,EmptyG],VarG]

(12,51)-(12,55)
l2
VarG

(13,9)-(13,45)
List.append (clone 0 diff) l2
AppG [AppG [EmptyG,EmptyG],VarG]

(13,47)-(13,51)
l1
VarG

*)

(* type error slice
(12,9)-(12,49)
(12,10)-(12,21)
(12,22)-(12,48)
(13,9)-(13,45)
(13,10)-(13,21)
(13,22)-(13,44)
*)
