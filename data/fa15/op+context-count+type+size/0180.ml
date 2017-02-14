
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
(8,19)-(8,24)
(8,37)-(8,38)
(8,46)-(8,47)
(8,46)-(8,64)
(8,50)-(8,55)
(8,59)-(8,60)
(8,63)-(8,64)
*)

(* type error slice
(3,27)-(3,60)
(3,35)-(3,40)
(3,35)-(3,49)
(3,54)-(3,60)
(3,59)-(3,60)
(7,3)-(8,64)
(7,11)-(7,22)
(7,11)-(7,25)
(8,3)-(8,64)
(8,3)-(8,64)
(8,19)-(8,38)
(8,37)-(8,38)
(8,46)-(8,64)
(8,50)-(8,55)
(8,50)-(8,64)
*)
