
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in l1 (pad @ l2)
  else (let pad = clone 0 (- sizDif) in (pad @ l1) l2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

*)

(* changed spans
(7,35)-(7,48)
(8,40)-(8,53)
*)

(* type error slice
(5,15)-(5,31)
(5,16)-(5,27)
(5,28)-(5,30)
(7,35)-(7,37)
(7,35)-(7,48)
(8,40)-(8,50)
(8,40)-(8,53)
(8,45)-(8,46)
*)
