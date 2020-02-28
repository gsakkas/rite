
let rec listReverse l =
  match l with
  | [] -> []
  | head::[] -> [head]
  | head::tail -> (listReverse [tail]) @ [head];;


(* fix

let rec listReverse l =
  match l with
  | [] -> []
  | head::[] -> [head]
  | head::tail -> (listReverse tail) @ [head];;

*)

(* changed spans
(6,32)-(6,38)
tail
VarG

*)

(* type error slice
(2,4)-(6,50)
(2,21)-(6,48)
(3,3)-(6,48)
(3,9)-(3,10)
(6,19)-(6,39)
(6,20)-(6,31)
(6,32)-(6,38)
(6,33)-(6,37)
*)
