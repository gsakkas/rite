
let rec listReverse l =
  let l' = [] in
  match l with | [] -> l' | l -> (listReverse (List.tl l)) :: (List.hd l);;


(* fix

let rec listReverse l =
  let l' = [] in
  match l with | [] -> l' | h::t -> (List.hd l) :: (listReverse (List.tl l));;

*)

(* changed spans
(4,3)-(4,74)
match l with
| [] -> l'
| h :: t -> (List.hd l) :: (listReverse (List.tl l))
CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,ConAppG (Just EmptyG)),(ConPatG Nothing,Nothing,VarG)])

*)

(* type error slice
(2,4)-(4,76)
(2,21)-(4,74)
(3,3)-(4,74)
(4,3)-(4,74)
(4,34)-(4,59)
(4,34)-(4,74)
(4,35)-(4,46)
*)
