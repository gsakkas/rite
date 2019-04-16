
let rec listReverse l =
  match l with | [] -> [] | t::h::[] -> [h; listReverse t];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | _::h::[] -> h :: (listReverse []);;

*)

(* changed spans
(3,3)-(3,59)
match l with
| [] -> []
| _ :: h :: [] -> h :: (listReverse [])
CaseG VarG (fromList [(ConsPatG WildPatG (ConsPatG EmptyPatG EmptyPatG),Nothing,ConAppG (Just EmptyG)),(ConPatG Nothing,Nothing,ListG (fromList []))])

*)

(* type error slice
(2,4)-(3,61)
(2,21)-(3,59)
(3,3)-(3,59)
(3,9)-(3,10)
(3,45)-(3,56)
(3,45)-(3,58)
(3,57)-(3,58)
*)
