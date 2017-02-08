
let rec clone x n =
  let rec cloneHelper x n acc =
    if n < 0 then acc else cloneHelper x (n - 1) (x :: acc) in
  cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then ((List.combine ((clone 0 (abs diff)), l1)), l2)
  else if diff > 0 then (l1, (List.combine ((clone 0 diff), l2)));;


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
(10,10)-(10,22)
(10,10)-(10,48)
(10,25)-(10,30)
(10,25)-(10,48)
(11,8)-(11,63)
(11,31)-(11,43)
(11,31)-(11,63)
(11,46)-(11,51)
(11,46)-(11,63)
*)

(* type error slice
(10,10)-(10,22)
(10,10)-(10,48)
(10,25)-(10,48)
(11,8)-(11,63)
(11,8)-(11,63)
(11,8)-(11,63)
(11,26)-(11,63)
(11,31)-(11,43)
(11,31)-(11,63)
(11,46)-(11,63)
*)
