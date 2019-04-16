
let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n < 0 then ((((clone 0) - n) @ l1), l2) else (l1, ((clone 0 n) @ l2));;


(* fix

let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n < 0 then (((clone 0 (- n)) @ l1), l2) else (l1, ((clone 0 n) @ l2));;

*)

(* changed spans
(7,19)-(7,34)
clone 0 (- n)
AppG (fromList [UopG EmptyG,LitG])

*)

(* type error slice
(3,55)-(3,72)
(3,56)-(3,61)
(7,18)-(7,40)
(7,19)-(7,34)
(7,20)-(7,29)
(7,21)-(7,26)
(7,35)-(7,36)
*)
