
let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec additivePersistence n =
  match digitsOfInt n with | [] -> 0 | h::t -> h + t;;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let rec additivePersistence n =
  match digitsOfInt n with | [] -> 0 | _ -> sumList (digitsOfInt n);;

*)

(* changed spans
(7,28)-(8,52)
xs
VarG

(7,28)-(8,52)
h
VarG

(7,28)-(8,52)
sumList
VarG

(7,28)-(8,52)
t
VarG

(7,28)-(8,52)
fun xs ->
  match xs with
  | [] -> 0
  | h :: t -> h + sumList t
  | _ -> (-1)
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(7,28)-(8,52)
sumList t
AppG (fromList [VarG])

(7,28)-(8,52)
h + sumList t
BopG VarG (AppG (fromList [EmptyG]))

(7,28)-(8,52)
0
LitG

(7,28)-(8,52)
(-1)
LitG

(7,28)-(8,52)
match xs with
| [] -> 0
| h :: t -> h + sumList t
| _ -> (-1)
CaseG VarG (fromList [(Nothing,BopG EmptyG EmptyG),(Nothing,LitG)])

(8,2)-(8,52)
match digitsOfInt n with
| [] -> 0
| _ -> sumList (digitsOfInt n)
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,LitG)])

(8,51)-(8,52)
sumList (digitsOfInt n)
AppG (fromList [AppG (fromList [EmptyG])])

*)
