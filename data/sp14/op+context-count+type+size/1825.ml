
let x = [1; 2; 3];;

let rec listReverse l =
  match l with | [] -> [] | x::[] -> [x] | head::tail::third -> head :: tail;;


(* fix

let x = [1; 2; 3];;

let rec listReverse l =
  match l with | [] -> [] | x::[] -> [x] | head::tail::third -> [head; tail];;

*)

(* changed spans
(5,64)-(5,76)
*)

(* type error slice
(5,2)-(5,76)
(5,2)-(5,76)
(5,2)-(5,76)
(5,64)-(5,68)
(5,64)-(5,76)
(5,64)-(5,76)
(5,72)-(5,76)
*)
