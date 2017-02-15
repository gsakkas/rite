
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
(7,35)-(7,50)
(7,38)-(7,39)
(7,45)-(7,46)
(8,40)-(8,55)
(8,45)-(8,46)
(8,51)-(8,52)
*)

(* type error slice
(2,43)-(2,65)
(2,48)-(2,65)
(2,49)-(2,54)
(5,15)-(5,31)
(5,16)-(5,27)
(5,28)-(5,30)
(5,34)-(5,50)
(5,35)-(5,46)
(5,47)-(5,49)
(7,7)-(7,50)
(7,17)-(7,22)
(7,17)-(7,31)
(7,35)-(7,37)
(7,35)-(7,50)
(7,38)-(7,39)
(7,40)-(7,50)
(7,41)-(7,44)
(7,45)-(7,46)
(8,7)-(8,56)
(8,18)-(8,23)
(8,18)-(8,36)
(8,40)-(8,50)
(8,40)-(8,55)
(8,41)-(8,44)
(8,45)-(8,46)
(8,51)-(8,52)
(8,53)-(8,55)
*)
