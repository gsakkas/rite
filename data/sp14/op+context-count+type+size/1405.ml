
let rec listReverse l = match l with | [] -> [] | h::t -> [h; listReverse t];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(2,58)-(2,76)
(2,59)-(2,60)
(2,62)-(2,75)
*)

(* type error slice
(2,3)-(2,78)
(2,20)-(2,76)
(2,24)-(2,76)
(2,58)-(2,76)
(2,58)-(2,76)
(2,62)-(2,73)
(2,62)-(2,75)
*)
