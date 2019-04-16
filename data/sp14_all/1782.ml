
let padZero l1 l2 = if l1 < l2 then 0;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let first = List.length l1 in
  let sec = List.length l2 in
  if first < sec
  then ((List.append (clone 0 (sec - first)) l1), l2)
  else
    if first > sec
    then (l1, (List.append (clone 0 (first - sec)) l2))
    else (l1, l2);;

*)

(* changed spans
(2,21)-(2,38)
let first = List.length l1 in
let sec = List.length l2 in
if first < sec
then (List.append (clone 0
                         (sec - first)) l1 , l2)
else if first > sec
     then (l1 , List.append (clone 0
                                   (first - sec)) l2)
     else (l1 , l2)
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)

*)

(* type error slice
(2,21)-(2,38)
(2,37)-(2,38)
(2,38)-(2,38)
*)
