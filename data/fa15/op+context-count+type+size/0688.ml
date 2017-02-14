
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
(9,26)-(9,31)
(9,26)-(9,35)
(9,26)-(9,41)
(9,40)-(9,41)
(10,27)-(10,32)
(10,27)-(10,42)
(10,33)-(10,34)
(10,35)-(10,36)
(10,41)-(10,42)
*)

(* type error slice
(6,3)-(10,42)
(6,11)-(6,22)
(6,11)-(6,25)
(7,3)-(10,42)
(7,11)-(7,22)
(7,11)-(7,25)
(9,26)-(9,41)
(9,40)-(9,41)
(10,27)-(10,42)
(10,41)-(10,42)
*)
