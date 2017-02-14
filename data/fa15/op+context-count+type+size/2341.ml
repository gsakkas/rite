
let rec listReverse l = match l with | [] -> 0 | h::t -> [h];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(2,45)-(2,46)
(2,57)-(2,60)
(2,58)-(2,59)
*)

(* type error slice
(2,24)-(2,60)
(2,24)-(2,60)
(2,45)-(2,46)
(2,57)-(2,60)
*)
