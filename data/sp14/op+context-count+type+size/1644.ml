
let rec listReverse l = match l with | [] -> [] | h::t -> [(listReverse t) h];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t; [h]);;

*)

(* changed spans
(2,59)-(2,78)
(2,61)-(2,77)
(2,76)-(2,77)
*)

(* type error slice
(2,4)-(2,80)
(2,21)-(2,78)
(2,25)-(2,78)
(2,59)-(2,78)
(2,61)-(2,72)
(2,61)-(2,74)
(2,61)-(2,77)
*)
