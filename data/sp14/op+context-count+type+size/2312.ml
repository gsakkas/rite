
let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  List.append
    ((clone 0 (lenl1 - lenl2) l1),
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
(7,2)-(7,13)
(7,2)-(9,49)
(8,5)-(8,33)
(8,6)-(8,11)
*)

(* type error slice
(2,43)-(2,66)
(2,47)-(2,48)
(2,49)-(2,66)
(2,50)-(2,55)
(8,5)-(8,33)
(8,6)-(8,11)
(9,6)-(9,48)
(9,7)-(9,18)
(9,19)-(9,44)
(9,20)-(9,25)
*)
