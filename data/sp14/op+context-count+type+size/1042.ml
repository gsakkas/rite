
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let length1 = List.fold_left (fun acc  -> fun x  -> acc + 1) 0 l1 in
  let length2 = List.fold_left (fun acc  -> fun x  -> acc + 1) 0 l2 in
  if length1 < length2
  then clone (length2 - length1) 0
  else if length2 < length1 then clone (length1 - length2) 0;;


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
(8,7)-(8,12)
(8,7)-(8,34)
(8,13)-(8,32)
(8,14)-(8,21)
(8,24)-(8,31)
(9,7)-(9,60)
(9,10)-(9,27)
(9,33)-(9,38)
(9,33)-(9,60)
(9,39)-(9,58)
(9,40)-(9,47)
(9,50)-(9,57)
(9,59)-(9,60)
*)

(* type error slice
(2,43)-(2,65)
(2,48)-(2,65)
(2,49)-(2,54)
(9,7)-(9,60)
(9,7)-(9,60)
(9,7)-(9,60)
(9,33)-(9,38)
(9,33)-(9,60)
*)
