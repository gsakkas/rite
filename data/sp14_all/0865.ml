
let rec sumList xs =
  match xs with | [] -> [] | _ -> (List.hd xs) + (List.tl sumList);;


(* fix

let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList (List.tl xs));;

*)

(* changed spans
(3,3)-(3,67)
match xs with
| [] -> 0
| xs -> List.hd xs + sumList (List.tl xs)
CaseG VarG (fromList [(VarPatG,Nothing,BopG EmptyG EmptyG),(ConPatG Nothing,Nothing,LitG)])

*)

(* type error slice
(3,3)-(3,67)
(3,25)-(3,27)
(3,35)-(3,67)
(3,50)-(3,67)
(3,51)-(3,58)
*)
