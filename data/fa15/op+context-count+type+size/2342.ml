
let rec listReverse l = match l with | [] -> 0 | h::t -> h @ [];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(2,46)-(2,47)
(2,58)-(2,59)
(2,62)-(2,64)
*)

(* type error slice
(2,25)-(2,64)
(2,25)-(2,64)
(2,46)-(2,47)
(2,58)-(2,64)
(2,60)-(2,61)
*)
