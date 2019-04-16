
let padZero l1 l2 =
  let a = List.length l1 in let b = List.length l2 in if a < b then a;;


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
(3,3)-(3,70)
let (a , b) =
  (List.length l1 , List.length l2) in
if a < b
then (List.append (clone 0
                         (b - a)) l1 , l2)
else if b < a
     then (l1 , List.append (clone 0
                                   (a - b)) l2)
     else (l1 , l2)
LetG NonRec (fromList [(TuplePatG (fromList [VarPatG]),TupleG (fromList [EmptyG]))]) (IteG EmptyG EmptyG EmptyG)

*)

(* type error slice
(3,3)-(3,70)
(3,11)-(3,22)
(3,11)-(3,25)
(3,55)-(3,70)
(3,69)-(3,70)
(3,70)-(3,70)
*)
