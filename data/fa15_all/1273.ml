
let rec listReverse l =
  let newList = [] in
  match l with
  | [] -> []
  | head::[] -> [head]
  | head::tail -> [listReverse tail; head];;


(* fix

let rec listReverse l =
  match l with
  | [] -> []
  | head::[] -> [head]
  | head::tail -> (listReverse tail) @ [head];;

*)

(* changed spans
(3,3)-(7,43)
match l with
| [] -> []
| head :: [] -> [head]
| head :: tail -> listReverse tail @ [head]
CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,AppG (fromList [EmptyG])),(ConsPatG VarPatG (ConPatG Nothing),Nothing,ListG (fromList [EmptyG])),(ConPatG Nothing,Nothing,ListG (fromList []))])

*)

(* type error slice
(2,4)-(7,45)
(2,21)-(7,43)
(3,3)-(7,43)
(4,3)-(7,43)
(4,9)-(4,10)
(6,17)-(6,23)
(6,18)-(6,22)
(7,19)-(7,43)
(7,20)-(7,31)
(7,20)-(7,36)
(7,32)-(7,36)
(7,38)-(7,42)
*)
