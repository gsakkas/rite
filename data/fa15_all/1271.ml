
let rec listReverse l =
  let newList = [] in
  match l with
  | [] -> []
  | head::[] -> head
  | head::tail -> (listReverse tail) :: head;;


(* fix

let rec listReverse l =
  match l with
  | [] -> []
  | head::[] -> [head]
  | head::tail -> (listReverse tail) @ [head];;

*)

(* changed spans
(6,16)-(6,20)
[head]
ListG VarG Nothing

(7,18)-(7,36)
(@)
VarG

(7,18)-(7,44)
listReverse tail @ [head]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(7,40)-(7,44)
[head]
ListG VarG Nothing

*)
