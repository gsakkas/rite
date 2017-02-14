
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
(8,5)-(8,16)
(8,5)-(8,33)
(8,18)-(8,20)
(8,28)-(8,33)
(10,5)-(14,17)
(12,50)-(12,52)
(13,8)-(13,19)
(13,8)-(13,37)
(13,28)-(13,33)
(13,35)-(13,37)
*)

(* type error slice
(2,51)-(2,56)
(2,51)-(2,65)
(2,60)-(2,65)
(7,16)-(7,27)
(7,16)-(7,30)
(7,28)-(7,30)
(8,18)-(8,20)
(8,18)-(8,33)
(8,28)-(8,29)
(8,28)-(8,33)
(10,5)-(14,17)
(10,5)-(14,17)
(12,8)-(13,37)
(12,38)-(12,49)
(12,38)-(12,52)
(12,50)-(12,52)
(13,8)-(13,19)
(13,8)-(13,37)
(13,21)-(13,26)
(13,21)-(13,37)
(13,28)-(13,29)
(13,28)-(13,33)
(13,35)-(13,37)
(14,11)-(14,17)
*)
