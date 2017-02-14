
let rec clone x n = match n with | 0 -> [] | _ -> [clone x];;


(* fix

let rec clone x n = match n with | 0 -> [] | n -> [x] @ (clone x (n - 1));;

*)

(* changed spans
(2,20)-(2,59)
(2,50)-(2,59)
(2,51)-(2,56)
(2,51)-(2,58)
*)

(* type error slice
(2,3)-(2,61)
(2,14)-(2,59)
(2,16)-(2,59)
(2,20)-(2,59)
(2,50)-(2,59)
(2,50)-(2,59)
(2,51)-(2,56)
(2,51)-(2,58)
*)
