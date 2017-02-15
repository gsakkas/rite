
let rec clone x n = if n <= 0 then [] else x :: ((clone x n) - 1);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,48)-(2,65)
(2,58)-(2,59)
*)

(* type error slice
(2,3)-(2,67)
(2,14)-(2,65)
(2,16)-(2,65)
(2,20)-(2,65)
(2,43)-(2,65)
(2,43)-(2,65)
(2,48)-(2,65)
(2,48)-(2,65)
(2,49)-(2,60)
(2,50)-(2,55)
*)
