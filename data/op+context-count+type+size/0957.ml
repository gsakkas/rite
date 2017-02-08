
let rec clone x n =
  let rec cloneHelper x n acc =
    if n < 0 then acc else ((cloneHelper x n) - (1 x)) :: acc in
  cloneHelper x n [];;


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
(4,30)-(4,45)
(4,30)-(4,53)
(4,30)-(4,62)
(4,42)-(4,43)
(4,44)-(4,45)
(4,50)-(4,53)
(4,52)-(4,53)
(5,3)-(5,21)
(5,15)-(5,16)
*)

(* type error slice
(3,3)-(5,21)
(3,23)-(4,62)
(3,25)-(4,62)
(3,27)-(4,62)
(4,30)-(4,41)
(4,30)-(4,45)
(4,30)-(4,53)
(4,50)-(4,51)
(4,50)-(4,53)
(5,3)-(5,14)
(5,3)-(5,21)
*)
