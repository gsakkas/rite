
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1 :: pad) :: l2
  else (let pad = clone 0 (- sizDif) in (pad :: l1) :: l2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

*)

(* changed spans
(7,35)-(7,46)
(7,35)-(7,52)
(7,42)-(7,45)
(8,40)-(8,51)
(8,40)-(8,57)
(8,41)-(8,44)
*)

(* type error slice
(2,43)-(2,44)
(2,43)-(2,65)
(2,43)-(2,65)
(2,48)-(2,65)
(2,49)-(2,54)
(2,55)-(2,56)
(5,15)-(5,31)
(5,16)-(5,27)
(5,28)-(5,30)
(7,7)-(7,52)
(7,17)-(7,22)
(7,17)-(7,31)
(7,23)-(7,24)
(7,35)-(7,46)
(7,35)-(7,46)
(7,35)-(7,46)
(7,35)-(7,52)
(7,35)-(7,52)
(7,36)-(7,38)
(7,42)-(7,45)
(7,50)-(7,52)
(8,40)-(8,51)
(8,40)-(8,51)
(8,40)-(8,57)
(8,40)-(8,57)
(8,48)-(8,50)
(8,55)-(8,57)
*)
