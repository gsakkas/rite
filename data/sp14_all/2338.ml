
let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b then List.append (clone 0 (b - a)) l1;;


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
(10,17)-(10,49)
(List.append (clone 0 (b - a))
             l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(10,49)-(10,49)
if b < a
then (l1 , List.append (clone 0
                              (a - b)) l2)
else (l1 , l2)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

*)

(* type error slice
(10,3)-(10,49)
(10,17)-(10,28)
(10,17)-(10,49)
(10,49)-(10,49)
*)
