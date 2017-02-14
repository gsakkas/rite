
let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if 1 then List.append (clone 0 1) l1;;


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
(10,3)-(10,39)
(10,6)-(10,7)
(10,13)-(10,39)
(10,34)-(10,35)
*)

(* type error slice
(10,3)-(10,39)
(10,3)-(10,39)
(10,3)-(10,39)
(10,3)-(10,39)
(10,6)-(10,7)
(10,13)-(10,24)
(10,13)-(10,39)
*)
