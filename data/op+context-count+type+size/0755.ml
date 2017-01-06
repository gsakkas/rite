
let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let a = List.length l1 in let b = List.length l2 in if 1 < 2 then clone 0 1;;



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


(* changed spans
(9,26)-(9,36)
(9,58)-(9,59)
(9,62)-(9,63)
(9,77)-(9,78)
*)

(* type error slice
(9,11)-(9,25)
*)
