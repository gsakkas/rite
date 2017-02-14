
let rec listReverse l = match l with | [] -> [] | h::t -> [t; h];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(2,59)-(2,65)
(2,60)-(2,61)
(2,63)-(2,64)
*)

(* type error slice
(2,25)-(2,65)
(2,25)-(2,65)
(2,59)-(2,65)
(2,59)-(2,65)
(2,60)-(2,61)
(2,63)-(2,64)
*)
