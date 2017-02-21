
let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then let z = x - y in (clone 0 z) :: y
  else (let z = y - x in (clone 0 z) :: x);;


(* fix

let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then let z = x - y in (l1, ((clone 0 z) @ l2))
  else (let z = y - x in (((clone 0 z) @ l1), l2));;

*)

(* changed spans
(9,24)-(9,35)
(9,24)-(9,40)
(9,25)-(9,30)
(9,39)-(9,40)
(10,25)-(10,41)
(10,26)-(10,31)
(10,32)-(10,33)
(10,34)-(10,35)
(10,40)-(10,41)
*)

(* type error slice
(6,2)-(10,42)
(6,10)-(6,21)
(6,10)-(6,24)
(7,2)-(10,42)
(7,10)-(7,21)
(7,10)-(7,24)
(9,24)-(9,40)
(9,39)-(9,40)
(10,25)-(10,41)
(10,40)-(10,41)
*)

(* all spans
(2,14)-(3,66)
(2,16)-(3,66)
(3,2)-(3,66)
(3,8)-(3,9)
(3,34)-(3,36)
(3,44)-(3,66)
(3,44)-(3,45)
(3,49)-(3,66)
(3,50)-(3,55)
(3,56)-(3,57)
(3,58)-(3,65)
(3,59)-(3,60)
(3,63)-(3,64)
(5,12)-(10,42)
(5,15)-(10,42)
(6,2)-(10,42)
(6,10)-(6,24)
(6,10)-(6,21)
(6,22)-(6,24)
(7,2)-(10,42)
(7,10)-(7,24)
(7,10)-(7,21)
(7,22)-(7,24)
(8,2)-(10,42)
(8,5)-(8,10)
(8,5)-(8,6)
(8,9)-(8,10)
(9,7)-(9,40)
(9,15)-(9,20)
(9,15)-(9,16)
(9,19)-(9,20)
(9,24)-(9,40)
(9,24)-(9,35)
(9,25)-(9,30)
(9,31)-(9,32)
(9,33)-(9,34)
(9,39)-(9,40)
(10,7)-(10,42)
(10,16)-(10,21)
(10,16)-(10,17)
(10,20)-(10,21)
(10,25)-(10,41)
(10,25)-(10,36)
(10,26)-(10,31)
(10,32)-(10,33)
(10,34)-(10,35)
(10,40)-(10,41)
*)