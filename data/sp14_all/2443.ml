
let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then
    let l1G = (List.length l1) - (List.length l2) in
    List.append (l1 clone (0 l1G))
  else
    if (List.length l1) < (List.length l2)
    then
      (let l2G = (List.length l2) - (List.length l2) in
       List.append (clone (0 l2G) l2))
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
(8,5)-(8,35)
(l1 , List.append (clone 0
                         l1G) l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(12,50)-(12,52)
l1
VarG

(13,8)-(13,38)
(List.append (clone 0 l2G)
             l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* type error slice
(2,50)-(2,67)
(2,51)-(2,56)
(2,59)-(2,66)
(7,15)-(7,31)
(7,16)-(7,27)
(7,28)-(7,30)
(8,17)-(8,35)
(8,18)-(8,20)
(8,27)-(8,34)
(8,28)-(8,29)
(10,5)-(14,18)
(12,7)-(13,39)
(12,37)-(12,53)
(12,38)-(12,49)
(12,50)-(12,52)
(13,8)-(13,19)
(13,8)-(13,38)
(13,20)-(13,38)
(13,21)-(13,26)
(13,27)-(13,34)
(13,28)-(13,29)
(13,35)-(13,37)
(14,10)-(14,18)
*)
