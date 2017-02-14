
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
(7,36)-(7,51)
(7,42)-(7,45)
(7,42)-(7,51)
(8,42)-(8,45)
(8,42)-(8,51)
(8,42)-(8,58)
*)

(* type error slice
(7,8)-(7,51)
(7,18)-(7,23)
(7,18)-(7,32)
(7,36)-(7,38)
(7,36)-(7,51)
(7,36)-(7,51)
(7,42)-(7,45)
(7,42)-(7,51)
(7,42)-(7,51)
(7,42)-(7,51)
(7,49)-(7,51)
(8,9)-(8,58)
(8,19)-(8,24)
(8,19)-(8,36)
(8,42)-(8,45)
(8,42)-(8,51)
(8,42)-(8,51)
(8,42)-(8,51)
(8,42)-(8,58)
(8,42)-(8,58)
(8,49)-(8,51)
(8,56)-(8,58)
*)
