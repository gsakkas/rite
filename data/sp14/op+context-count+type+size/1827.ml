
let x = [1; 2; 3];;

let rec listReverse l =
  match l with
  | [] -> []
  | x::[] -> [x]
  | head::tail -> head :: (listReverse tail) :: tail;;


(* fix

let x = [1; 2; 3];;

let rec listReverse l =
  match l with
  | [] -> []
  | x::[] -> [x]
  | head::tail -> head :: (listReverse tail);;

*)

(* changed spans
(8,26)-(8,52)
(8,48)-(8,52)
*)

(* type error slice
(4,3)-(8,54)
(4,20)-(8,52)
(5,2)-(8,52)
(5,2)-(8,52)
(5,2)-(8,52)
(5,8)-(5,9)
(7,13)-(7,16)
(7,13)-(7,16)
(7,14)-(7,15)
(8,26)-(8,44)
(8,26)-(8,52)
(8,26)-(8,52)
(8,27)-(8,38)
(8,39)-(8,43)
(8,48)-(8,52)
*)
