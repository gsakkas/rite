
let rec clone x n =
  if n <= 0 then [] else (let y = clone x (n - 1) in x :: y);;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x < y then ((clone 0 (y - x)), y) else (x, (clone 0 (x - y)));;


(* fix

let rec clone x n =
  if n <= 0 then [] else (let y = clone x (n - 1) in x :: y);;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x < y
  then (((clone 0 (y - x)) @ l1), l2)
  else (l1, ((clone 0 (x - y)) @ l2));;

*)

(* changed spans
(8,18)-(8,23)
(8,36)-(8,37)
(8,44)-(8,66)
(8,45)-(8,46)
(8,49)-(8,54)
(8,58)-(8,59)
(8,62)-(8,63)
*)

(* type error slice
(3,25)-(3,60)
(3,34)-(3,39)
(3,34)-(3,49)
(3,53)-(3,59)
(3,58)-(3,59)
(7,2)-(8,66)
(7,10)-(7,21)
(7,10)-(7,24)
(8,2)-(8,66)
(8,2)-(8,66)
(8,16)-(8,38)
(8,36)-(8,37)
(8,44)-(8,66)
(8,48)-(8,65)
(8,49)-(8,54)
*)
