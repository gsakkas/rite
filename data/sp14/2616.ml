
let rec clone x n =
  let rec helper a b acc = if b > 0 then helper a (b - 1) (a :: acc) else acc in
  helper x n [];;

let padZero l1 l2 =
  let l1_len = List.length l1 in
  let l2_len = List.length l2 in
  let l_diff = l1_len - l2_len in
  let to_append = clone 0 l_diff in if l_diff < 0 then ((to_append @ l1), l2);;


(* fix

let rec clone x n =
  let rec helper a b acc = if b > 0 then helper a (b - 1) (a :: acc) else acc in
  helper x n [];;

let padZero l1 l2 =
  let l1_len = List.length l1 in
  let l2_len = List.length l2 in
  let l_diff = l1_len - l2_len in
  let to_append = clone 0 l_diff in
  if l_diff < 0 then ((to_append @ l1), l2) else (l1, (to_append @ l2));;

*)

(* changed spans
(10,36)-(10,77)
*)

(* type error slice
(10,36)-(10,77)
(10,55)-(10,77)
*)

(* all spans
(2,14)-(4,15)
(2,16)-(4,15)
(3,2)-(4,15)
(3,17)-(3,77)
(3,19)-(3,77)
(3,21)-(3,77)
(3,27)-(3,77)
(3,30)-(3,35)
(3,30)-(3,31)
(3,34)-(3,35)
(3,41)-(3,68)
(3,41)-(3,47)
(3,48)-(3,49)
(3,50)-(3,57)
(3,51)-(3,52)
(3,55)-(3,56)
(3,58)-(3,68)
(3,59)-(3,60)
(3,64)-(3,67)
(3,74)-(3,77)
(4,2)-(4,15)
(4,2)-(4,8)
(4,9)-(4,10)
(4,11)-(4,12)
(4,13)-(4,15)
(6,12)-(10,77)
(6,15)-(10,77)
(7,2)-(10,77)
(7,15)-(7,29)
(7,15)-(7,26)
(7,27)-(7,29)
(8,2)-(10,77)
(8,15)-(8,29)
(8,15)-(8,26)
(8,27)-(8,29)
(9,2)-(10,77)
(9,15)-(9,30)
(9,15)-(9,21)
(9,24)-(9,30)
(10,2)-(10,77)
(10,18)-(10,32)
(10,18)-(10,23)
(10,24)-(10,25)
(10,26)-(10,32)
(10,36)-(10,77)
(10,39)-(10,49)
(10,39)-(10,45)
(10,48)-(10,49)
(10,55)-(10,77)
(10,56)-(10,72)
(10,67)-(10,68)
(10,57)-(10,66)
(10,69)-(10,71)
(10,74)-(10,76)
*)
