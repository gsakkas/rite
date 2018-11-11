
let rec listReverse l =
  let l' = [] in
  match l with | [] -> l' | l -> (listReverse (List.tl l)) :: (List.hd l);;


(* fix

let rec listReverse l =
  let l' = [] in
  match l with | [] -> l' | h::t -> (List.hd l) :: (listReverse (List.tl l));;

*)

(* changed spans
(4,2)-(4,73)
match l with
| [] -> l'
| h :: t -> (List.hd l) :: (listReverse (List.tl l))
CaseG VarG [(Nothing,VarG),(Nothing,ConAppG (Just (TupleG [AppG [VarG],AppG [AppG [VarG]]])) Nothing)]

(4,34)-(4,45)
List.hd
VarG

(4,34)-(4,45)
l
VarG

(4,34)-(4,45)
listReverse (List.tl l)
AppG [AppG [EmptyG]]

*)
