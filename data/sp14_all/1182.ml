
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
(7,6)-(7,23)
length1 = length2
BopG VarG VarG

(8,8)-(8,35)
(l1 , l2)
TupleG (fromList [VarG])

(9,34)-(9,61)
(List.append (clone 0
                    (length2 - length1)) l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(9,61)-(9,61)
(l1 , List.append (clone 0
                         (length1 - length2)) l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* type error slice
(2,44)-(2,66)
(2,49)-(2,66)
(2,50)-(2,55)
(9,8)-(9,61)
(9,34)-(9,39)
(9,34)-(9,61)
(9,61)-(9,61)
*)
