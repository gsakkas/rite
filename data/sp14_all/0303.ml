
let rec append l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (append t l2);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append (listReverse t [h]);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(5,37)-(5,63)
listReverse t @ [h]
AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])

*)

(* type error slice
(2,64)-(2,77)
(2,65)-(2,71)
(4,4)-(5,65)
(4,21)-(5,63)
(5,3)-(5,63)
(5,24)-(5,26)
(5,37)-(5,43)
(5,37)-(5,63)
(5,44)-(5,63)
(5,45)-(5,56)
*)
