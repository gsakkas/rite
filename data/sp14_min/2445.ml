
let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then
    let l1G = (List.length l1) - (List.length l2) in
    List.append (l1, ((clone 0 l1G) l2))
  else
    if (List.length l1) < (List.length l2)
    then
      (let l2G = (List.length l2) - (List.length l1) in
       List.append (((clone 0 l2G) l1), l2))
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
(8,5)-(8,41)
(l1 , List.append (clone 0
                         l1G) l2)
TupleG [VarG,AppG [EmptyG,EmptyG]]

(13,8)-(13,44)
(List.append (clone 0 l2G)
             l1 , l2)
TupleG [AppG [EmptyG,EmptyG],VarG]

*)

(* type error slice
(2,44)-(2,67)
(2,48)-(2,49)
(2,50)-(2,67)
(2,51)-(2,56)
(8,5)-(8,16)
(8,5)-(8,41)
(8,17)-(8,41)
(8,22)-(8,40)
(8,23)-(8,36)
(8,24)-(8,29)
(13,8)-(13,19)
(13,8)-(13,44)
(13,20)-(13,44)
(13,21)-(13,39)
(13,22)-(13,35)
(13,23)-(13,28)
*)
