
let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then List.append (clone 0 (b - a)) l1
  else if b < a then List.append (clone 0 (a - b)) l2 else (l1, l2);;


(* fix

let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

*)

(* changed spans
(11,8)-(11,40)
(12,8)-(12,67)
(12,22)-(12,54)
(12,61)-(12,63)
(12,65)-(12,67)
*)

(* type error slice
(12,8)-(12,67)
(12,8)-(12,67)
(12,22)-(12,33)
(12,22)-(12,54)
(12,61)-(12,67)
*)
