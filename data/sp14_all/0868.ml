
let rec sumList xs =
  match xs with | [] -> [] | _ -> (List.hd xs) + (sumList List.tl xs);;


(* fix

let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList (List.tl xs));;

*)

(* changed spans
(3,3)-(3,70)
match xs with
| [] -> 0
| xs -> List.hd xs + sumList (List.tl xs)
CaseG VarG (fromList [(VarPatG,Nothing,BopG EmptyG EmptyG),(ConPatG Nothing,Nothing,LitG)])

*)

(* type error slice
(2,4)-(3,72)
(2,17)-(3,70)
(3,3)-(3,70)
(3,25)-(3,27)
(3,35)-(3,47)
(3,35)-(3,70)
(3,36)-(3,43)
(3,44)-(3,46)
(3,50)-(3,70)
(3,51)-(3,58)
(3,59)-(3,66)
*)
