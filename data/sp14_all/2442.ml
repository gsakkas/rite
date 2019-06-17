
let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then
    let l1G = (List.length l1) - (List.length l2) in
    List.append (l1, (clone (0 l1G)))
  else
    if (List.length l1) < (List.length l2)
    then
      (let l2G = (List.length l2) - (List.length l2) in
       List.append ((clone (0 l2G)), l2))
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
(8,5)-(8,38)
(l1 , List.append (clone 0
                         l1G) l2)
TupleG [VarG,AppG [EmptyG,EmptyG]]

(12,50)-(12,52)
l1
VarG

(13,8)-(13,41)
(List.append (clone 0 l2G)
             l1 , l2)
TupleG [AppG [EmptyG,EmptyG],VarG]

*)

(* type error slice
(8,5)-(8,16)
(8,5)-(8,38)
(8,17)-(8,38)
(8,29)-(8,36)
(8,30)-(8,31)
(13,8)-(13,19)
(13,8)-(13,41)
(13,20)-(13,41)
(13,28)-(13,35)
(13,29)-(13,30)
*)
