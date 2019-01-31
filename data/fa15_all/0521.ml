
let rec assoc (d,k,l) =
  match l with | [] -> (-1) | h::l' -> let (x,y) = h in print_int h;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> (-1)
  | h::l' -> let (x,y) = h in (match x with | k -> y | _ -> assoc (d, k, l'));;

*)

(* changed spans
(3,56)-(3,67)
x
VarG

(3,56)-(3,67)
y
VarG

(3,56)-(3,67)
match x with
| k -> y
| _ -> assoc (d , k , l')
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG]))])

(3,66)-(3,67)
assoc
VarG

*)
