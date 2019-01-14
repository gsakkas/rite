
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) :: h;;


(* fix

let rec listReverse l =
  let h::t = l in match l with | [] -> [] | h::t -> listReverse t;;

*)

(* changed spans
(3,2)-(3,56)
l
VarG

(3,2)-(3,56)
let h :: t = l in
match l with
| [] -> []
| h :: t -> listReverse t
LetG NonRec (fromList [VarG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

*)
