
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in l1 :: pad :: l2
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
(7,35)-(7,50)
(7,41)-(7,44)
(7,41)-(7,50)
(8,40)-(8,51)
(8,40)-(8,57)
(8,41)-(8,44)
*)

(* type error slice
(7,7)-(7,50)
(7,17)-(7,22)
(7,17)-(7,31)
(7,35)-(7,37)
(7,35)-(7,50)
(7,35)-(7,50)
(7,41)-(7,44)
(7,41)-(7,50)
(7,41)-(7,50)
(7,41)-(7,50)
(7,48)-(7,50)
(8,7)-(8,58)
(8,18)-(8,23)
(8,18)-(8,36)
(8,40)-(8,51)
(8,40)-(8,51)
(8,40)-(8,51)
(8,40)-(8,57)
(8,40)-(8,57)
(8,41)-(8,44)
(8,48)-(8,50)
(8,55)-(8,57)
*)
