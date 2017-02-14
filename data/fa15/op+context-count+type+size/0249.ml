
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in l1 ^ ("],[" ^ (pad @ l2))
  else (let pad = clone 0 (- sizDif) in (pad @ l1) ^ ("],[" ^ l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

*)

(* changed spans
(7,35)-(7,60)
(7,38)-(7,39)
(7,41)-(7,46)
(7,47)-(7,48)
(7,49)-(7,59)
(8,40)-(8,50)
(8,40)-(8,65)
(8,51)-(8,52)
*)

(* type error slice
(5,15)-(5,31)
(5,16)-(5,27)
(5,28)-(5,30)
(7,35)-(7,37)
(7,35)-(7,60)
(7,38)-(7,39)
(7,40)-(7,60)
(7,47)-(7,48)
(7,49)-(7,59)
(7,54)-(7,55)
(7,56)-(7,58)
(8,40)-(8,50)
(8,40)-(8,65)
(8,45)-(8,46)
(8,51)-(8,52)
(8,53)-(8,65)
(8,60)-(8,61)
(8,62)-(8,64)
*)
