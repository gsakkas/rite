
let rec append list1 list2 = match list1 with | [] -> [] | h::t -> h :: list2;;

let rec listReverse l =
  match l with | [] -> [] | h::[] -> l | h::t -> listReverse (append (t [h]));;


(* fix

let rec append list1 list2 = match list1 with | [] -> [] | h::t -> h :: list2;;

let rec listReverse l =
  match l with | [] -> [] | h::[] -> l | h::t -> listReverse (append t [h]);;

*)

(* changed spans
(5,61)-(5,77)
append t [h]
AppG (fromList [VarG,ListG EmptyG Nothing])

*)
