
let rec listReverse l =
  let newList = [] in
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
(7,18)-(7,44)
listReverse tail @ [head]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(7,19)-(7,37)
(@)
VarG

(7,39)-(7,43)
[head]
ListG VarG Nothing

*)
