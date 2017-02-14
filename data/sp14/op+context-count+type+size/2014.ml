
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
(5,2)-(8,49)
(8,27)-(8,28)
(8,27)-(8,49)
(8,32)-(8,33)
(8,32)-(8,49)
(8,37)-(8,49)
*)

(* type error slice
(5,2)-(8,49)
(5,2)-(8,49)
(5,2)-(8,49)
(8,37)-(8,41)
(8,37)-(8,49)
(8,37)-(8,49)
(8,45)-(8,49)
*)
