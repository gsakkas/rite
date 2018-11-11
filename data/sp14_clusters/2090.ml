
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) > (List.length l2)
    then (let y = clone l1 ((List.length l1) - (List.length l2)) in (y, l2))
    else (let z = clone l2 ((List.length l2) - (List.length l1)) in (z, l1));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) > (List.length l2)
    then
      (let y = clone (List.hd l1) ((List.length l1) - (List.length l2)) in
       (y, l2))
    else
      (let z = clone (List.hd l2) ((List.length l2) - (List.length l1)) in
       (z, l1));;

*)

(* changed spans
(9,24)-(9,26)
List.hd
VarG

(9,24)-(9,26)
List.hd l1
AppG [VarG]

(10,24)-(10,26)
List.hd
VarG

(10,24)-(10,26)
List.hd l2
AppG [VarG]

*)
