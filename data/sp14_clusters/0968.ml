
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
(11,36)-(11,38)
len2
VarG

(11,41)-(11,43)
len1
VarG

(12,12)-(12,48)
List.append (clone 0
                   (len1 - len2)) l2
AppG [AppG [EmptyG,EmptyG],VarG]

(12,25)-(12,47)
clone 0 (len1 - len2)
AppG [LitG,BopG EmptyG EmptyG]

(12,40)-(12,42)
len1
VarG

(12,44)-(12,46)
len2
VarG

*)
