
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
listReverse tail @ [head]
AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(6,47)
(2,21)-(6,45)
(3,3)-(6,45)
(5,17)-(5,23)
(5,18)-(5,22)
(6,19)-(6,45)
(6,20)-(6,31)
(6,20)-(6,38)
(6,40)-(6,44)
*)
