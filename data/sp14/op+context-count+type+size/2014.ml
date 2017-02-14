
let x = [1; 2; 3];;

let rec listReverse l =
  match l with
  | [] -> []
  | x::[] -> [x]
  | head::tail::t::s::l -> s :: t :: tail :: head;;


(* fix

let x = [1; 2; 3];;

let rec listReverse l =
  match l with | [] -> [] | x::[] -> [x] | head::tail::third -> [head; tail];;

*)

(* changed spans
(5,3)-(8,50)
(8,28)-(8,29)
(8,28)-(8,50)
(8,33)-(8,34)
(8,33)-(8,50)
(8,38)-(8,50)
*)

(* type error slice
(5,3)-(8,50)
(5,3)-(8,50)
(5,3)-(8,50)
(8,38)-(8,42)
(8,38)-(8,50)
(8,38)-(8,50)
(8,46)-(8,50)
*)
