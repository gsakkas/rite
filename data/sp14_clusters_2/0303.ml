
let rec append l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (append t l2);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append (listReverse t [h]);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(5,44)-(5,55)
(@)
VarG

(5,44)-(5,55)
listReverse t
AppG (fromList [VarG])

*)
