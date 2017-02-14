
let rec listReverse l = match l with | h::t -> [h] @ (listReverse [t]);;


(* fix

let rec listReverse l = match l with | h::t -> [h] @ (listReverse t);;

*)

(* changed spans
(2,67)-(2,70)
*)

(* type error slice
(2,4)-(2,73)
(2,21)-(2,70)
(2,25)-(2,70)
(2,25)-(2,70)
(2,31)-(2,32)
(2,55)-(2,66)
(2,55)-(2,70)
(2,67)-(2,70)
(2,67)-(2,70)
(2,68)-(2,69)
*)
