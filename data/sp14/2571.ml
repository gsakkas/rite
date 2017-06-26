
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
(5,64)-(5,68)
(5,64)-(5,76)
(5,72)-(5,76)
*)

(* all spans
(2,8)-(2,17)
(2,9)-(2,10)
(2,12)-(2,13)
(2,15)-(2,16)
(4,20)-(5,76)
(5,2)-(5,76)
(5,8)-(5,9)
(5,23)-(5,25)
(5,37)-(5,40)
(5,38)-(5,39)
(5,64)-(5,76)
(5,64)-(5,68)
(5,72)-(5,76)
*)
