
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
(8,5)-(8,39)
(l1 , List.append (clone 0
                         l1G) l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(12,50)-(12,52)
l1
VarG

(13,8)-(13,42)
(List.append (clone 0 l2G)
             l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* type error slice
(8,5)-(8,16)
(8,5)-(8,39)
(8,17)-(8,39)
(10,8)-(10,24)
(10,9)-(10,20)
(10,21)-(10,23)
(13,8)-(13,19)
(13,8)-(13,42)
(13,20)-(13,42)
(13,28)-(13,36)
(13,29)-(13,31)
*)
