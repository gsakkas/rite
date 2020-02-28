
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
(9,25)-(9,41)
(l1 , clone 0 z @ l2)
TupleG [VarG,AppG [EmptyG,EmptyG]]

(10,26)-(10,42)
(clone 0 z @ l1 , l2)
TupleG [AppG [EmptyG,EmptyG],VarG]

*)

(* type error slice
(6,3)-(10,43)
(6,11)-(6,22)
(6,11)-(6,25)
(7,3)-(10,43)
(7,11)-(7,22)
(7,11)-(7,25)
(9,25)-(9,41)
(9,40)-(9,41)
(10,26)-(10,42)
(10,41)-(10,42)
*)
