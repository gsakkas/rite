
let rec sumList xs = (List.hd xs) + (sumList List.tl xs);;


(* fix

let rec sumList xs = (List.hd xs) + (sumList (List.tl xs));;

*)

(* changed spans
(2,36)-(2,56)
(2,45)-(2,52)
*)

(* type error slice
(2,3)-(2,58)
(2,16)-(2,56)
(2,21)-(2,56)
(2,36)-(2,56)
(2,37)-(2,44)
*)
