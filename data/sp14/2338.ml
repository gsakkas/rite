
let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b then List.append (clone 0 (b - a)) l1;;


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
*)

(* type error slice
(10,2)-(10,48)
(10,16)-(10,27)
(10,16)-(10,48)
*)

(* all spans
(2,14)-(6,16)
(2,16)-(6,16)
(3,2)-(6,16)
(3,14)-(3,16)
(4,2)-(6,16)
(4,17)-(5,56)
(4,23)-(5,56)
(5,4)-(5,56)
(5,7)-(5,12)
(5,7)-(5,8)
(5,11)-(5,12)
(5,18)-(5,23)
(5,29)-(5,56)
(5,29)-(5,35)
(5,36)-(5,48)
(5,37)-(5,38)
(5,42)-(5,47)
(5,49)-(5,56)
(5,50)-(5,51)
(5,54)-(5,55)
(6,2)-(6,16)
(6,2)-(6,8)
(6,9)-(6,14)
(6,15)-(6,16)
(8,12)-(10,48)
(8,15)-(10,48)
(9,2)-(10,48)
(9,14)-(9,50)
(9,15)-(9,31)
(9,16)-(9,27)
(9,28)-(9,30)
(9,33)-(9,49)
(9,34)-(9,45)
(9,46)-(9,48)
(10,2)-(10,48)
(10,5)-(10,10)
(10,5)-(10,6)
(10,9)-(10,10)
(10,16)-(10,48)
(10,16)-(10,27)
(10,28)-(10,45)
(10,29)-(10,34)
(10,35)-(10,36)
(10,37)-(10,44)
(10,38)-(10,39)
(10,42)-(10,43)
(10,46)-(10,48)
*)
