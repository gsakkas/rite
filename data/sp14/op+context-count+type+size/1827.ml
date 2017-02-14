
let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then clone (l1, (0 :: l2))
  else
    if (List.length l1) < (List.length l2)
    then clone ((0 :: l1), l2)
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
(6,7)-(6,12)
(6,7)-(6,28)
(6,13)-(6,28)
(6,18)-(6,27)
(6,19)-(6,20)
(6,24)-(6,26)
(9,9)-(9,14)
(9,9)-(9,30)
(9,15)-(9,30)
(9,16)-(9,25)
(9,17)-(9,18)
(9,22)-(9,24)
(9,27)-(9,29)
(10,10)-(10,12)
(10,14)-(10,16)
*)

(* type error slice
(2,49)-(2,66)
(2,50)-(2,55)
(8,4)-(10,17)
(8,4)-(10,17)
(9,9)-(9,14)
(9,9)-(9,30)
(10,9)-(10,17)
*)
