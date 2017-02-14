
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  let sizDif = length1 - length2 in
  if sizDif > 0
  then l1 :: (clone 0 sizDif) :: l2
  else ((clone 0 (- sizDif)) :: l1) :: l2;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

*)

(* changed spans
(5,3)-(10,42)
(5,17)-(5,31)
(6,3)-(10,42)
(7,3)-(10,42)
(7,16)-(7,23)
(7,16)-(7,33)
(7,26)-(7,33)
(9,8)-(9,10)
(9,8)-(9,36)
(9,15)-(9,36)
(9,34)-(9,36)
(10,10)-(10,35)
(10,10)-(10,42)
(10,33)-(10,35)
*)

(* type error slice
(9,8)-(9,10)
(9,8)-(9,36)
(9,8)-(9,36)
(9,15)-(9,20)
(9,15)-(9,29)
(9,15)-(9,36)
(9,15)-(9,36)
(9,15)-(9,36)
(9,34)-(9,36)
(10,10)-(10,15)
(10,10)-(10,27)
(10,10)-(10,35)
(10,10)-(10,35)
(10,10)-(10,35)
(10,10)-(10,42)
(10,10)-(10,42)
(10,33)-(10,35)
(10,40)-(10,42)
*)
