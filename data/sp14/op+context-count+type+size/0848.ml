
let rec clone x n =
  let rec cloneHelper x n acc =
    if n < 0 then acc else cloneHelper (x, (n - 1), (x :: acc)) in
  cloneHelper x n [];;


(* fix

let rec clone x n =
  let rec cloneHelper (x,n,acc) =
    if n < 0 then acc else cloneHelper (x, (n - 1), (x :: acc)) in
  cloneHelper (x, n, []);;

*)

(* changed spans
(3,22)-(4,63)
(3,24)-(4,63)
(3,26)-(4,63)
(5,2)-(5,20)
(5,14)-(5,15)
*)

(* type error slice
(3,2)-(5,20)
(3,22)-(4,63)
(4,4)-(4,63)
(4,4)-(4,63)
(4,18)-(4,21)
(4,27)-(4,38)
(4,27)-(4,63)
(4,39)-(4,63)
(4,52)-(4,62)
(4,52)-(4,62)
(4,52)-(4,62)
(4,53)-(4,54)
(4,58)-(4,61)
(5,2)-(5,13)
(5,2)-(5,20)
*)
