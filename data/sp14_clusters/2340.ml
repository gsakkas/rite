
let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b then List.append (clone 0 1) l1;;


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
(10,2)-(10,42)
l2
VarG

(10,16)-(10,42)
(List.append (clone 0 (b - a))
             l1 , l2)
TupleG [AppG [EmptyG,EmptyG],VarG]

(10,37)-(10,38)
b - a
BopG VarG VarG

(10,40)-(10,42)
b
VarG

(10,40)-(10,42)
a
VarG

*)
