
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
(3,22)-(4,63)
(3,24)-(4,63)
(3,26)-(4,63)
*)

(* type error slice
(3,2)-(5,24)
(3,22)-(4,63)
(4,27)-(4,38)
(4,27)-(4,63)
(4,39)-(4,63)
(4,52)-(4,62)
(4,52)-(4,62)
(4,53)-(4,54)
*)
