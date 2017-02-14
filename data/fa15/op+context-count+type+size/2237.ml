
let rec listReverse l = match l with | [] -> [] | h::t -> t :: h;;


(* fix

let rec listReverse l = match l with | [] -> [] | h::t -> t @ [h];;

*)

(* changed spans
(2,59)-(2,60)
(2,59)-(2,65)
(2,64)-(2,65)
*)

(* type error slice
(2,25)-(2,65)
(2,25)-(2,65)
(2,59)-(2,60)
(2,59)-(2,65)
(2,59)-(2,65)
(2,64)-(2,65)
*)
