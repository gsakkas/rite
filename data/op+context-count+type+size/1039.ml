
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
(7,6)-(7,23)
(8,8)-(8,13)
(8,8)-(8,35)
(8,15)-(8,22)
(8,15)-(8,32)
(8,25)-(8,32)
(9,8)-(9,61)
(9,11)-(9,28)
(9,34)-(9,39)
(9,34)-(9,61)
(9,41)-(9,48)
(9,41)-(9,58)
(9,51)-(9,58)
(9,60)-(9,61)
*)

(* type error slice
(2,50)-(2,55)
(2,50)-(2,64)
(2,56)-(2,57)
(2,59)-(2,64)
(9,8)-(9,61)
(9,34)-(9,39)
(9,34)-(9,61)
(9,41)-(9,58)
(9,60)-(9,61)
*)
