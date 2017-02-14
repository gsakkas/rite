
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
(6,8)-(6,13)
(6,8)-(6,27)
(6,15)-(6,27)
(6,20)-(6,21)
(6,20)-(6,27)
(6,25)-(6,27)
(9,10)-(9,15)
(9,10)-(9,30)
(9,18)-(9,19)
(9,18)-(9,25)
(9,18)-(9,30)
(9,23)-(9,25)
(9,28)-(9,30)
(10,11)-(10,13)
(10,15)-(10,17)
*)

(* type error slice
(2,51)-(2,56)
(2,51)-(2,65)
(8,5)-(10,17)
(8,5)-(10,17)
(9,10)-(9,15)
(9,10)-(9,30)
(10,11)-(10,17)
*)
