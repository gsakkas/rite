
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
(8,37)-(8,41)
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

(* all spans
(2,8)-(2,17)
(2,9)-(2,10)
(2,12)-(2,13)
(2,15)-(2,16)
(4,20)-(8,49)
(5,2)-(8,49)
(5,8)-(5,9)
(6,10)-(6,12)
(7,13)-(7,16)
(7,14)-(7,15)
(8,27)-(8,49)
(8,27)-(8,28)
(8,32)-(8,49)
(8,32)-(8,33)
(8,37)-(8,49)
(8,37)-(8,41)
(8,45)-(8,49)
*)
