
let rec sumList xs = match xs with | [] -> [] | hd::tl -> hd + (sumList tl);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

*)

(* changed spans
(2,44)-(2,46)
*)

(* type error slice
(2,4)-(2,78)
(2,17)-(2,75)
(2,22)-(2,75)
(2,22)-(2,75)
(2,44)-(2,46)
(2,59)-(2,75)
(2,59)-(2,75)
(2,65)-(2,72)
(2,65)-(2,75)
*)
