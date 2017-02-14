
let rec clone x n = if n = 1 then [x] else List.append [x] ((clone x n) - 1);;


(* fix

let rec clone x n = if n = 1 then [x] else List.append [x] (clone x (n - 1));;

*)

(* changed spans
(2,59)-(2,76)
(2,69)-(2,70)
*)

(* type error slice
(2,3)-(2,78)
(2,14)-(2,76)
(2,16)-(2,76)
(2,20)-(2,76)
(2,34)-(2,37)
(2,43)-(2,54)
(2,43)-(2,76)
(2,59)-(2,76)
(2,59)-(2,76)
(2,60)-(2,71)
(2,61)-(2,66)
*)
