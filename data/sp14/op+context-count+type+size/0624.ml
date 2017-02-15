
let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b then List.append ((clone 0 b) - a) l1;;


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
(10,2)-(10,48)
(10,16)-(10,48)
(10,28)-(10,45)
(10,38)-(10,39)
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
(10,16)-(10,27)
(10,16)-(10,48)
(10,28)-(10,45)
(10,28)-(10,45)
(10,29)-(10,40)
(10,30)-(10,35)
*)
