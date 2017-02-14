
let rec listReverse l =
  match l with
  | [] -> []
  | head::[] -> [head]
  | head::tail -> [listReverse [tail]; head];;


(* fix

let rec listReverse l =
  match l with
  | [] -> []
  | head::[] -> [head]
  | head::tail -> (listReverse tail) @ [head];;

*)

(* changed spans
(6,19)-(6,45)
(6,20)-(6,38)
(6,32)-(6,38)
(6,40)-(6,44)
*)

(* type error slice
(2,4)-(6,47)
(2,21)-(6,45)
(3,3)-(6,45)
(3,3)-(6,45)
(3,9)-(3,10)
(6,20)-(6,31)
(6,20)-(6,38)
(6,32)-(6,38)
(6,32)-(6,38)
(6,33)-(6,37)
*)
