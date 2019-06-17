
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) > (List.length l2)
    then
      (let y = clone List.hd l1 ((List.length l1) - (List.length l2)) in
       (y, l2))
    else
      (let z = clone List.hd l2 ((List.length l2) - (List.length l1)) in
       (z, l1));;


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
(10,16)-(10,70)
clone (List.hd l1)
      (List.length l1 - List.length l2)
AppG [AppG [EmptyG],BopG EmptyG EmptyG]

(13,16)-(13,70)
clone (List.hd l2)
      (List.length l2 - List.length l1)
AppG [AppG [EmptyG],BopG EmptyG EmptyG]

*)

(* type error slice
(2,49)-(2,66)
(2,50)-(2,55)
(2,58)-(2,65)
(10,16)-(10,21)
(10,16)-(10,70)
(10,30)-(10,32)
(10,34)-(10,50)
(10,35)-(10,46)
(10,47)-(10,49)
(13,16)-(13,21)
(13,16)-(13,70)
(13,30)-(13,32)
(13,34)-(13,50)
(13,35)-(13,46)
(13,47)-(13,49)
*)
