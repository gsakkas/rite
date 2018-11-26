
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let length1 = List.fold_left (fun acc  -> fun x  -> acc + 1) 0 l1 in
  let length2 = List.fold_left (fun acc  -> fun x  -> acc + 1) 0 l2 in
  if length1 < length2
  then clone 0 (length2 - length1)
  else if length2 < length1 then clone 0 (length1 - length2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let length1 = List.fold_left (fun acc  -> fun x  -> acc + 1) 0 l1 in
  let length2 = List.fold_left (fun acc  -> fun x  -> acc + 1) 0 l2 in
  if length1 = length2
  then (l1, l2)
  else
    if length1 < length2
    then ((List.append (clone 0 (length2 - length1)) l1), l2)
    else (l1, (List.append (clone 0 (length1 - length2)) l2));;

*)

(* changed spans
(7,5)-(7,22)
length1
VarG

(7,5)-(7,22)
length2
VarG

(7,5)-(7,22)
l1
VarG

(7,5)-(7,22)
l2
VarG

(7,5)-(7,22)
length1 = length2
BopG VarG VarG

(7,5)-(7,22)
if length1 < length2
then (List.append (clone 0
                         (length2 - length1)) l1 , l2)
else (l1 , List.append (clone 0
                              (length1 - length2)) l2)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(7,5)-(7,22)
(l1 , l2)
TupleG (fromList [VarG])

(8,7)-(8,12)
List.append
VarG

(8,7)-(8,12)
clone 0 (length2 - length1)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(8,7)-(8,34)
(List.append (clone 0
                    (length2 - length1)) l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(9,7)-(9,60)
l2
VarG

(9,20)-(9,27)
l1
VarG

(9,33)-(9,38)
List.append
VarG

(9,33)-(9,38)
clone 0 (length1 - length2)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(9,33)-(9,60)
l2
VarG

(9,33)-(9,60)
l1
VarG

(9,33)-(9,60)
(l1 , List.append (clone 0
                         (length1 - length2)) l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)
