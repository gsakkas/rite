
let rec assoc (d,k,l) =
  match l with | [] -> (-1) | h::l' -> let (x,y) = h in print_int h;;


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
CaseG VarG [(VarPatG,Nothing,VarG),(WildPatG,Nothing,AppG [EmptyG])]

*)

(* type error slice
(3,40)-(3,68)
(3,52)-(3,53)
(3,57)-(3,66)
(3,57)-(3,68)
(3,67)-(3,68)
*)
