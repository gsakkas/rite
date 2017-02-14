
let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then
    List.append [(clone 0 ((List.length l2) - (List.length l1))) @ l1] [l2]
  else
    (List.length l2) <
      ((List.length l1) List.append [l1]
         [(clone 0 ((List.length l1) - (List.length l2))) @ l2]);;


(* fix

let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

*)

(* changed spans
(10,5)-(10,16)
(10,5)-(10,76)
(10,17)-(10,71)
(10,72)-(10,76)
(12,6)-(12,20)
(12,6)-(14,64)
(12,18)-(12,20)
(13,9)-(14,64)
(13,21)-(13,23)
(13,25)-(13,36)
(13,37)-(13,41)
(13,38)-(13,40)
(14,10)-(14,64)
(14,12)-(14,63)
*)

(* type error slice
(8,3)-(14,64)
(8,3)-(14,64)
(10,5)-(10,16)
(10,5)-(10,76)
(12,6)-(14,64)
(13,9)-(13,20)
(13,9)-(13,23)
(13,9)-(14,64)
*)
