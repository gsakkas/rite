
let rec listReverse l = match l with | [] -> [] | h::t -> 0;;


(* fix

let rec listReverse l = match l with | [] -> [] | h::t -> [];;

*)

(* changed spans
(2,59)-(2,60)
*)

(* type error slice
(2,25)-(2,60)
(2,25)-(2,60)
(2,46)-(2,48)
(2,59)-(2,60)
*)
