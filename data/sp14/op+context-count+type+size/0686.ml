
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
(9,3)-(9,78)
(9,11)-(9,25)
(9,29)-(9,78)
(9,55)-(9,78)
(9,58)-(9,59)
(9,62)-(9,63)
(9,69)-(9,74)
(9,69)-(9,78)
(9,77)-(9,78)
*)

(* type error slice
(2,4)-(6,19)
(2,15)-(6,17)
(2,17)-(6,17)
(3,3)-(6,17)
(4,3)-(6,17)
(5,5)-(5,56)
(5,5)-(5,56)
(5,19)-(5,24)
(5,30)-(5,36)
(5,30)-(5,56)
(5,38)-(5,48)
(5,43)-(5,48)
(6,3)-(6,9)
(6,3)-(6,17)
(9,55)-(9,78)
(9,55)-(9,78)
(9,55)-(9,78)
(9,69)-(9,74)
(9,69)-(9,78)
*)
