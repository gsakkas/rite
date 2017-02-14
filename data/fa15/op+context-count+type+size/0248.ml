
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
(7,37)-(7,46)
(7,37)-(7,53)
(7,43)-(7,46)
(8,42)-(8,45)
(8,42)-(8,51)
(8,42)-(8,58)
*)

(* type error slice
(2,44)-(2,45)
(2,44)-(2,64)
(2,44)-(2,64)
(2,50)-(2,55)
(2,50)-(2,64)
(2,56)-(2,57)
(5,17)-(5,28)
(5,17)-(5,31)
(5,29)-(5,31)
(7,8)-(7,53)
(7,18)-(7,23)
(7,18)-(7,32)
(7,24)-(7,25)
(7,37)-(7,39)
(7,37)-(7,46)
(7,37)-(7,46)
(7,37)-(7,46)
(7,37)-(7,53)
(7,37)-(7,53)
(7,43)-(7,46)
(7,51)-(7,53)
(8,42)-(8,51)
(8,42)-(8,51)
(8,42)-(8,58)
(8,42)-(8,58)
(8,49)-(8,51)
(8,56)-(8,58)
*)
