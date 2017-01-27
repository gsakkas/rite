
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
(7,3)-(7,14)
(7,3)-(9,48)
(8,7)-(8,12)
(8,7)-(8,33)
*)

(* type error slice
(2,51)-(2,56)
(2,51)-(2,65)
(2,57)-(2,58)
(2,60)-(2,65)
(5,15)-(5,26)
(5,15)-(5,29)
(5,27)-(5,29)
(6,15)-(6,26)
(6,15)-(6,29)
(6,27)-(6,29)
(7,3)-(7,14)
(7,3)-(9,48)
(8,7)-(8,12)
(8,7)-(8,33)
(8,7)-(9,48)
(8,13)-(8,14)
(8,16)-(8,29)
(8,31)-(8,33)
(9,8)-(9,19)
(9,8)-(9,48)
(9,21)-(9,26)
(9,21)-(9,43)
(9,27)-(9,28)
(9,30)-(9,43)
(9,46)-(9,48)
*)
