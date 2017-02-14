
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
(3,22)-(4,61)
(3,24)-(4,61)
(3,26)-(4,61)
(4,27)-(4,54)
(4,27)-(4,61)
(4,28)-(4,45)
(4,41)-(4,42)
(4,43)-(4,44)
(4,48)-(4,53)
(4,51)-(4,52)
(5,2)-(5,20)
(5,14)-(5,15)
*)

(* type error slice
(3,2)-(5,20)
(3,22)-(4,61)
(3,24)-(4,61)
(3,26)-(4,61)
(4,27)-(4,54)
(4,28)-(4,45)
(4,29)-(4,40)
(4,48)-(4,53)
(4,49)-(4,50)
(5,2)-(5,13)
(5,2)-(5,20)
*)
