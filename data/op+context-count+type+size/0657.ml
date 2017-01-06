
let rec listReverse l = match l with | [] -> [] | h::t -> [t; listReverse h];;



let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;


(* changed spans
(2,59)-(2,62)
*)

(* type error slice
(2,63)-(2,76)
*)
