
let rec sumList xs = match xs with | [] -> [] | hd::tl -> hd + (sumList tl);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

*)

(* changed spans
(2,43)-(2,45)
*)

(* type error slice
(2,3)-(2,77)
(2,16)-(2,75)
(2,21)-(2,75)
(2,43)-(2,45)
(2,58)-(2,75)
(2,63)-(2,75)
(2,64)-(2,71)
*)

(* all spans
(2,16)-(2,75)
(2,21)-(2,75)
(2,27)-(2,29)
(2,43)-(2,45)
(2,58)-(2,75)
(2,58)-(2,60)
(2,63)-(2,75)
(2,64)-(2,71)
(2,72)-(2,74)
*)
