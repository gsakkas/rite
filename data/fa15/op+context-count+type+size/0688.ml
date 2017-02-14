
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
