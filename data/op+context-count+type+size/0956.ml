
let rec clone x n = if n < 0 then [] else clone (x, (n - 1));;


(* fix

let rec clone x n =
  let rec cloneHelper (x,n,acc) =
    if n < 0 then acc else cloneHelper (x, (n - 1), (x :: acc)) in
  cloneHelper (x, n, []);;

*)

(* changed spans
(2,21)-(2,59)
(2,35)-(2,37)
(2,43)-(2,48)
(2,50)-(2,51)
(2,50)-(2,59)
*)

(* type error slice
(2,4)-(2,63)
(2,15)-(2,59)
(2,43)-(2,48)
(2,43)-(2,59)
(2,50)-(2,51)
(2,50)-(2,59)
*)
