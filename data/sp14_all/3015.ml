
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
(12,8)-(12,68)
(List.append (clone 0
                    (- diff)) l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(13,8)-(13,64)
(List.append (clone 0 diff)
             l2 , l1)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* type error slice
(12,8)-(12,19)
(12,8)-(12,68)
(12,20)-(12,68)
(12,21)-(12,61)
(12,22)-(12,33)
(12,34)-(12,60)
(13,8)-(13,19)
(13,8)-(13,64)
(13,20)-(13,64)
(13,21)-(13,57)
(13,22)-(13,33)
(13,34)-(13,56)
*)
