
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
(8,5)-(8,16)
(8,5)-(8,36)
(8,23)-(8,28)
(8,23)-(8,36)
(8,30)-(8,32)
(8,30)-(8,36)
(8,34)-(8,36)
(12,50)-(12,52)
(13,8)-(13,19)
(13,8)-(13,41)
(13,22)-(13,27)
(13,22)-(13,35)
(13,29)-(13,31)
(13,29)-(13,35)
(13,39)-(13,41)
*)

(* type error slice
(8,5)-(8,16)
(8,5)-(8,36)
(8,18)-(8,36)
(10,9)-(10,20)
(10,9)-(10,23)
(10,21)-(10,23)
(13,8)-(13,19)
(13,8)-(13,41)
(13,22)-(13,41)
(13,29)-(13,31)
(13,29)-(13,35)
*)
