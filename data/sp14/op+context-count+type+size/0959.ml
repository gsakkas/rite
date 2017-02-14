
let rec clone x n =
  let rec cloneHelper x n acc =
    if n < 0 then acc else cloneHelper x (n - 1) (x :: acc) in
  cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then ((List.append ((clone 0 (abs diff)), l1)), l2)
  else if diff > 0 then (l1, (List.append ((clone 0 diff), l2)));;


(* fix

let rec clone x n =
  let rec cloneHelper x n acc =
    if n < 0 then acc else cloneHelper x (n - 1) (x :: acc) in
  cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then ((List.append (clone 0 (abs diff)) l1), l2)
  else if diff > 0 then (l1, (List.append (clone 0 diff) l2)) else (l1, l2);;

*)

(* changed spans
(10,10)-(10,47)
(10,24)-(10,47)
(11,8)-(11,62)
(11,31)-(11,62)
(11,45)-(11,62)
*)

(* type error slice
(10,10)-(10,21)
(10,10)-(10,47)
(10,24)-(10,47)
(11,8)-(11,62)
(11,8)-(11,62)
(11,8)-(11,62)
(11,26)-(11,62)
(11,31)-(11,42)
(11,31)-(11,62)
(11,45)-(11,62)
*)
