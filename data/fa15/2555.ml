
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in l1 ^ (pad ^ l2)
  else (let pad = clone 0 (- sizDif) in (pad ^ l1) ^ l2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

*)

(* changed spans
(7,36)-(7,51)
(l1 , pad @ l2)
TupleG [VarG,AppG [EmptyG,EmptyG]]

(8,41)-(8,56)
(pad @ l1 , l2)
TupleG [AppG [EmptyG,EmptyG],VarG]

*)

(* type error slice
(2,44)-(2,66)
(2,49)-(2,66)
(2,50)-(2,55)
(5,16)-(5,32)
(5,17)-(5,28)
(5,29)-(5,31)
(5,35)-(5,51)
(5,36)-(5,47)
(5,48)-(5,50)
(7,8)-(7,51)
(7,18)-(7,23)
(7,18)-(7,32)
(7,36)-(7,38)
(7,36)-(7,51)
(7,39)-(7,40)
(7,41)-(7,51)
(7,42)-(7,45)
(7,46)-(7,47)
(8,8)-(8,57)
(8,19)-(8,24)
(8,19)-(8,37)
(8,41)-(8,51)
(8,41)-(8,56)
(8,42)-(8,45)
(8,46)-(8,47)
(8,52)-(8,53)
(8,54)-(8,56)
*)
