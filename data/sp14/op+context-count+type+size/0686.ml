
let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let a = List.length l1 in let b = List.length l2 in if 1 < 2 then clone 0 1;;


(* fix

let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

*)

(* changed spans
(9,2)-(9,77)
(9,10)-(9,24)
(9,28)-(9,77)
(9,54)-(9,77)
(9,57)-(9,58)
(9,61)-(9,62)
(9,68)-(9,73)
(9,68)-(9,77)
(9,76)-(9,77)
*)

(* type error slice
(2,3)-(6,18)
(2,14)-(6,16)
(2,16)-(6,16)
(3,2)-(6,16)
(4,2)-(6,16)
(5,4)-(5,56)
(5,4)-(5,56)
(5,18)-(5,23)
(5,29)-(5,35)
(5,29)-(5,56)
(5,36)-(5,48)
(5,42)-(5,47)
(6,2)-(6,8)
(6,2)-(6,16)
(9,54)-(9,77)
(9,54)-(9,77)
(9,54)-(9,77)
(9,68)-(9,73)
(9,68)-(9,77)
*)
