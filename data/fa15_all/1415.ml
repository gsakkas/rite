
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec digitalRoot n =
  match n with | x::[] -> x | h::t -> h + (digitalRoot (digits t));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  match digits n with | x::[] -> x | h::t -> h + (digitalRoot (sumList t));;

*)

(* changed spans
(7,20)-(8,66)
xs
VarG

(7,20)-(8,66)
h
VarG

(7,20)-(8,66)
sumList
VarG

(7,20)-(8,66)
t
VarG

(7,20)-(8,66)
fun xs ->
  match xs with
  | [] -> 0
  | h :: t -> h + sumList t
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(7,20)-(8,66)
sumList t
AppG (fromList [VarG])

(7,20)-(8,66)
h + sumList t
BopG VarG (AppG (fromList [EmptyG]))

(7,20)-(8,66)
0
LitG

(7,20)-(8,66)
match xs with
| [] -> 0
| h :: t -> h + sumList t
CaseG VarG (fromList [(Nothing,BopG EmptyG EmptyG),(Nothing,LitG)])

(8,8)-(8,9)
digits
VarG

(8,8)-(8,9)
digits n
AppG (fromList [VarG])

(8,56)-(8,62)
sumList
VarG

*)
