
let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  if lenl1 < lenl2
  then
    ((List.append (clone 0 (lenl1 - lenl2)) l1),
      (List.append (clone 0 (lenl1 - lenl2)) l2));;


(* fix

let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  ((List.append (clone 0 (lenl1 - lenl2)) l1),
    (List.append (clone 0 (lenl1 - lenl2)) l2));;

*)

(* changed spans
(7,2)-(10,49)
(7,5)-(7,10)
(7,5)-(7,18)
(7,13)-(7,18)
(10,29)-(10,34)
*)

(* type error slice
(7,2)-(10,49)
(7,2)-(10,49)
(7,2)-(10,49)
(9,4)-(10,49)
*)
