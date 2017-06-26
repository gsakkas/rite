
let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in if a < b then "";;


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
(2,12)-(3,70)
(3,54)-(3,70)
(3,68)-(3,70)
*)

(* type error slice
(3,54)-(3,70)
(3,68)-(3,70)
*)

(* all spans
(2,12)-(3,70)
(2,15)-(3,70)
(3,2)-(3,70)
(3,14)-(3,50)
(3,15)-(3,31)
(3,16)-(3,27)
(3,28)-(3,30)
(3,33)-(3,49)
(3,34)-(3,45)
(3,46)-(3,48)
(3,54)-(3,70)
(3,57)-(3,62)
(3,57)-(3,58)
(3,61)-(3,62)
(3,68)-(3,70)
*)
