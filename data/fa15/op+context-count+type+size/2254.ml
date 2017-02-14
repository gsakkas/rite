
let rec sumList xs = (List.hd xs) + (sumList List.tl xs);;


(* fix

let rec sumList xs = (List.hd xs) + (sumList (List.tl xs));;

*)

(* changed spans
(2,38)-(2,56)
(2,46)-(2,53)
*)

(* type error slice
(2,4)-(2,59)
(2,17)-(2,56)
(2,23)-(2,56)
(2,38)-(2,45)
(2,38)-(2,56)
*)
