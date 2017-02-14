
let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then
    let l1G = (List.length l1) - (List.length l2) in
    List.append (l1, (clone (0, l1G)))
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
(8,5)-(8,16)
(8,5)-(8,36)
(8,23)-(8,28)
(8,23)-(8,36)
(8,30)-(8,36)
(10,5)-(14,17)
(12,50)-(12,52)
(13,8)-(13,19)
(13,8)-(13,40)
(13,22)-(13,27)
(13,22)-(13,34)
(13,29)-(13,34)
(13,38)-(13,40)
*)

(* type error slice
(8,5)-(8,16)
(8,5)-(8,36)
(8,18)-(8,36)
(13,8)-(13,19)
(13,8)-(13,40)
(13,22)-(13,40)
(13,29)-(13,30)
(13,29)-(13,34)
*)
