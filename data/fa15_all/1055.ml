
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
(9,15)-(9,16)
l1
VarG

(9,19)-(9,20)
(@)
VarG

(9,19)-(9,20)
clone 0 z
AppG (fromList [VarG,LitG])

(9,24)-(9,40)
(l1 , clone 0 z @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(9,39)-(9,40)
l2
VarG

(10,20)-(10,21)
(@)
VarG

(10,20)-(10,21)
clone 0 z
AppG (fromList [VarG,LitG])

(10,25)-(10,41)
(clone 0 z @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(10,32)-(10,33)
l2
VarG

(10,40)-(10,41)
l1
VarG

*)
