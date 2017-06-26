
let rec listReverse l = match l with | [] -> 0 | h::t -> h @ [];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(2,45)-(2,46)
(2,57)-(2,58)
(2,61)-(2,63)
*)

(* type error slice
(2,24)-(2,63)
(2,45)-(2,46)
(2,57)-(2,63)
(2,59)-(2,60)
*)

(* all spans
(2,20)-(2,63)
(2,24)-(2,63)
(2,30)-(2,31)
(2,45)-(2,46)
(2,57)-(2,63)
(2,59)-(2,60)
(2,57)-(2,58)
(2,61)-(2,63)
*)
