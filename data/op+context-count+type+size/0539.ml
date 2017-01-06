
let rec sumList xs = match xs with | [] -> [] | hd::tl -> hd + (sumList tl);;



let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;


(* changed spans
(2,44)-(2,46)
*)

(* type error slice
(2,22)-(2,75)
*)
