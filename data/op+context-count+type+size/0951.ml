
let rec clone x n =
  let rec cloneHelper x n acc =
    if n < 0 then acc else cloneHelper (x, (n - 1), (x :: acc)) in
  cloneHelper (x, n, []);;


(* fix

let rec clone x n =
  let rec cloneHelper (x,n,acc) =
    if n < 0 then acc else cloneHelper (x, (n - 1), (x :: acc)) in
  cloneHelper (x, n, []);;

*)

(* changed spans
(3,23)-(4,62)
(3,25)-(4,62)
(3,27)-(4,62)
*)

(* type error slice
(3,3)-(5,24)
(3,23)-(4,62)
(3,25)-(4,62)
(3,27)-(4,62)
(4,5)-(4,62)
(4,8)-(4,9)
(4,8)-(4,13)
(4,12)-(4,13)
(4,19)-(4,22)
(4,28)-(4,39)
(4,28)-(4,62)
(4,41)-(4,42)
(4,41)-(4,62)
(4,45)-(4,50)
(4,54)-(4,55)
(4,54)-(4,62)
(4,59)-(4,62)
*)
