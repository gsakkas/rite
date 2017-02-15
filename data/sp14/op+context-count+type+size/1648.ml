
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
(8,4)-(8,34)
(8,17)-(8,19)
(8,26)-(8,33)
(10,4)-(14,17)
(12,49)-(12,51)
(13,7)-(13,18)
(13,7)-(13,37)
(13,26)-(13,33)
(13,34)-(13,36)
*)

(* type error slice
(2,49)-(2,66)
(2,50)-(2,55)
(2,58)-(2,65)
(7,14)-(7,30)
(7,15)-(7,26)
(7,27)-(7,29)
(8,16)-(8,34)
(8,17)-(8,19)
(8,26)-(8,33)
(8,27)-(8,28)
(10,4)-(14,17)
(10,4)-(14,17)
(12,6)-(13,38)
(12,36)-(12,52)
(12,37)-(12,48)
(12,49)-(12,51)
(13,7)-(13,18)
(13,7)-(13,37)
(13,19)-(13,37)
(13,20)-(13,25)
(13,26)-(13,33)
(13,27)-(13,28)
(13,34)-(13,36)
(14,9)-(14,17)
*)
