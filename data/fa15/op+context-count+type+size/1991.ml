
let rec listReverse l = match l with | [] -> [] | h::t -> [t; h];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(2,58)-(2,64)
(2,59)-(2,60)
(2,62)-(2,63)
*)

(* type error slice
(2,24)-(2,64)
(2,24)-(2,64)
(2,58)-(2,64)
(2,58)-(2,64)
(2,59)-(2,60)
(2,62)-(2,63)
*)
