
let rec clone x n =
  let rec aux acc n =
    if n <= 0 then acc else aux (List.append [x] acc) (n - 1) in
  aux [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if l1 < l2
  then ((List.append (clone 0 (len2 - len1)) l1), l2)
  else (l1, (List.append (clone 0 (len1 - len2) l2)));;


(* fix

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

*)

(* changed spans
(12,13)-(12,53)
List.append (clone 0
                   (len1 - len2)) l2
AppG [AppG [EmptyG,EmptyG],VarG]

*)

(* type error slice
(2,4)-(5,13)
(2,15)-(5,11)
(2,17)-(5,11)
(3,3)-(5,11)
(4,5)-(4,62)
(4,20)-(4,23)
(4,29)-(4,32)
(4,29)-(4,62)
(4,33)-(4,54)
(4,34)-(4,45)
(4,50)-(4,53)
(5,3)-(5,6)
(5,3)-(5,11)
(10,3)-(12,54)
(10,6)-(10,8)
(10,6)-(10,13)
(10,11)-(10,13)
(11,8)-(11,54)
(11,9)-(11,49)
(11,10)-(11,21)
(11,51)-(11,53)
(12,8)-(12,54)
(12,9)-(12,11)
(12,13)-(12,53)
(12,14)-(12,25)
(12,26)-(12,52)
(12,27)-(12,32)
*)
