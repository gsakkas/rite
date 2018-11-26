
let rec clone x n =
  if n < 1
  then []
  else
    (let rec helper acc f x =
       match x with | 0 -> acc | _ -> helper (f :: acc) f (x - 1) in
     helper [] x n);;

let padZero l1 l2 =
  let x = (List.length l1) - (List.length l2) in
  if x
  then
    (if x < 0
     then (((clone 0 (abs x)) @ l1), l2)
     else (l1, ((clone 0 (abs x)) @ l2)))
  else (l1, l2);;


(* fix

let rec clone x n =
  if n < 1
  then []
  else
    (let rec helper acc f x =
       match x with | 0 -> acc | _ -> helper (f :: acc) f (x - 1) in
     helper [] x n);;

let padZero l1 l2 =
  let x = (List.length l1) - (List.length l2) in
  if x != 0
  then
    (if x < 0
     then (((clone 0 (abs x)) @ l1), l2)
     else (l1, ((clone 0 (abs x)) @ l2)))
  else (l1, l2);;

*)

(* changed spans
(12,5)-(12,6)
x <> 0
BopG VarG LitG

(14,4)-(16,41)
0
LitG

*)
