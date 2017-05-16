
let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l = match l with | [] -> [] | h::t -> cat listReverse t h;;


(* fix

let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> cat (listReverse t) h;;

*)

(* changed spans
(4,58)-(4,77)
(4,62)-(4,73)
*)

(* type error slice
(2,53)-(2,67)
(2,58)-(2,67)
(2,59)-(2,62)
(4,58)-(4,61)
(4,58)-(4,77)
*)

(* all spans
(2,12)-(2,67)
(2,14)-(2,67)
(2,18)-(2,67)
(2,24)-(2,25)
(2,39)-(2,42)
(2,40)-(2,41)
(2,53)-(2,67)
(2,53)-(2,54)
(2,58)-(2,67)
(2,59)-(2,62)
(2,63)-(2,64)
(2,65)-(2,66)
(4,20)-(4,77)
(4,24)-(4,77)
(4,30)-(4,31)
(4,45)-(4,47)
(4,58)-(4,77)
(4,58)-(4,61)
(4,62)-(4,73)
(4,74)-(4,75)
(4,76)-(4,77)
*)
