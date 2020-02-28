
let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if true then List.append l1 l1;;


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
(4,6)-(4,10)
a < b
BopG VarG VarG

(4,16)-(4,33)
(List.append (clone 0 (b - a))
             l1 , l2)
TupleG [AppG [EmptyG,EmptyG],VarG]

(4,33)-(4,33)
if b < a
then (l1 , List.append (clone 0
                              (a - b)) l2)
else (l1 , l2)
IteG (BopG EmptyG EmptyG) (TupleG [EmptyG,EmptyG]) (TupleG [EmptyG,EmptyG])

*)

(* type error slice
(4,3)-(4,33)
(4,16)-(4,27)
(4,16)-(4,33)
(4,33)-(4,33)
*)
