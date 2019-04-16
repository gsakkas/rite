
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
(8,27)-(8,53)
listReverse tail
AppG (fromList [VarG])

*)

(* type error slice
(4,4)-(8,55)
(4,21)-(8,53)
(5,3)-(8,53)
(5,9)-(5,10)
(7,14)-(7,17)
(7,15)-(7,16)
(8,27)-(8,45)
(8,27)-(8,53)
(8,28)-(8,39)
(8,40)-(8,44)
(8,49)-(8,53)
*)
