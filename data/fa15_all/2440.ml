
let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then
    let l1G = (List.length l1) - (List.length l2) in
    List.append (l1, (clone (l1, l2)))
  else
    if (List.length l1) < (List.length l2)
    then
      (let l2G = (List.length l2) - (List.length l2) in
       List.append ((clone (l1 l2G)), l2))
    else (l1, l2);;


(* fix

let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then
    let l1G = (List.length l1) - (List.length l2) in
    (l1, (List.append (clone 0 l1G) l2))
  else
    if (List.length l1) < (List.length l2)
    then
      (let l2G = (List.length l2) - (List.length l1) in
       ((List.append (clone 0 l2G) l1), l2))
    else (l1, l2);;

*)

(* changed spans
(8,21)-(8,37)
List.append (clone 0 l1G) l2
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(8,22)-(8,27)
List.append
VarG

(8,22)-(8,27)
clone 0 l1G
AppG (fromList [VarG,LitG])

(8,29)-(8,31)
0
LitG

(8,33)-(8,35)
l1G
VarG

(13,7)-(13,18)
l1
VarG

(13,20)-(13,36)
List.append (clone 0 l2G) l1
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(13,21)-(13,26)
List.append
VarG

(13,21)-(13,26)
clone 0 l2G
AppG (fromList [VarG,LitG])

(13,28)-(13,30)
0
LitG

(13,38)-(13,40)
l1
VarG

*)
