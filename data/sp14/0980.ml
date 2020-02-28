
let rec listReverse l = match l with | [] -> l | h::t -> [listReverse t; h];;


(* fix

let rec listReverse l =
  match l with | [] -> l | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(2,58)-(2,76)
listReverse t @ [h]
AppG [AppG [EmptyG],ListG [EmptyG]]

*)

(* type error slice
(2,4)-(2,78)
(2,21)-(2,76)
(2,25)-(2,76)
(2,31)-(2,32)
(2,46)-(2,47)
(2,58)-(2,76)
(2,59)-(2,70)
(2,59)-(2,72)
(2,74)-(2,75)
*)
