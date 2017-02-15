
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
(8,7)-(8,12)
(8,7)-(8,34)
(8,13)-(8,14)
(8,15)-(8,34)
(8,16)-(8,23)
(8,26)-(8,33)
(9,7)-(9,60)
(9,10)-(9,17)
(9,33)-(9,38)
(9,33)-(9,60)
(9,42)-(9,49)
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
