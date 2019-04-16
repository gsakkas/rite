
let rec assoc (d,k,l) =
  match l with | [] -> (-1) | h::l' -> let (x,y) = h in print_int y;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> (-1)
  | h::l' -> let (x,y) = h in (match x with | k -> y | _ -> assoc (d, k, l'));;

*)

(* changed spans
(3,57)-(3,68)
match x with
| k -> y
| _ -> assoc (d , k , l')
CaseG VarG (fromList [(VarPatG,Nothing,VarG),(WildPatG,Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(3,3)-(3,68)
(3,24)-(3,28)
(3,40)-(3,68)
(3,57)-(3,66)
(3,57)-(3,68)
*)
