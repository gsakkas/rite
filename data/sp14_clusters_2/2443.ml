
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
(8,4)-(8,15)
l1
VarG

(8,4)-(8,15)
List.append (clone 0 l1G) l2
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(8,4)-(8,34)
(l1 , List.append (clone 0
                         l1G) l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(10,4)-(14,17)
l2
VarG

(13,7)-(13,18)
List.append (clone 0 l2G) l1
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(13,7)-(13,18)
(List.append (clone 0 l2G)
             l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(13,7)-(13,37)
l1
VarG

(13,34)-(13,36)
l1
VarG

*)
