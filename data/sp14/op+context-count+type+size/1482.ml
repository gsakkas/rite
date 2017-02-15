
let rec listReverse l = match l with | [] -> [] | h::t -> [(listReverse t) h];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t; [h]);;

*)

(* changed spans
(2,58)-(2,77)
(2,59)-(2,76)
(2,75)-(2,76)
*)

(* type error slice
(2,3)-(2,79)
(2,20)-(2,77)
(2,24)-(2,77)
(2,58)-(2,77)
(2,59)-(2,74)
(2,59)-(2,76)
(2,60)-(2,71)
*)
