
let rec clone x n =
  let rec aux acc n =
    if n <= 0 then acc else aux (List.append [x] acc) (n - 1) in
  aux [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if l1 < l2
  then ((List.append (clone 0 (l2 - l1)) l1), l2)
  else (l1, (List.append (clone 0 (l1 - l2) l2)));;



let rec clone x n =
  let rec aux acc n =
    if n <= 0 then acc else aux (List.append [x] acc) (n - 1) in
  aux [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if l1 < l2
  then ((List.append (clone 0 (len2 - len1)) l1), l2)
  else (l1, (List.append (clone 0 (len1 - len2)) l2));;


(* changed spans
(11,32)-(11,34)
(11,37)-(11,39)
(12,36)-(12,38)
(12,41)-(12,43)
(12,45)-(12,47)
*)

(* type error slice
(4,34)-(4,53)
*)
