
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
(8,4)-(8,15)
(8,4)-(8,38)
(8,21)-(8,37)
(8,22)-(8,27)
(8,28)-(8,36)
(8,29)-(8,31)
(8,33)-(8,35)
(12,49)-(12,51)
(13,7)-(13,18)
(13,7)-(13,41)
(13,20)-(13,36)
(13,21)-(13,26)
(13,27)-(13,35)
(13,28)-(13,30)
(13,38)-(13,40)
*)

(* type error slice
(8,4)-(8,15)
(8,4)-(8,38)
(8,16)-(8,38)
(10,7)-(10,23)
(10,8)-(10,19)
(10,20)-(10,22)
(13,7)-(13,18)
(13,7)-(13,41)
(13,19)-(13,41)
(13,27)-(13,35)
(13,28)-(13,30)
*)
