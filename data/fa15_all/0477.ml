
let rec append xs ys = match xs with | [] -> ys | h::t -> h :: (append t ys);;

let rec digitsOfInt n =
  if n <= 0 then [] else append (digitsOfInt (n / 10)) [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec additivePersistence n = if (n / 10) <= 0 then 0 else digits n;;


(* fix

let rec append xs ys = match xs with | [] -> ys | h::t -> h :: (append t ys);;

let rec digitsOfInt n =
  if n <= 0 then [] else append (digitsOfInt (n / 10)) [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (n / 10) <= 0 then 0 else sumList (digits n);;

*)

(* changed spans
(9,28)-(9,69)
xs
VarG

(9,28)-(9,69)
h
VarG

(9,28)-(9,69)
sumList
VarG

(9,28)-(9,69)
t
VarG

(9,28)-(9,69)
fun xs ->
  match xs with
  | [] -> 0
  | h :: t -> h + sumList t
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(9,28)-(9,69)
sumList t
AppG (fromList [VarG])

(9,28)-(9,69)
h + sumList t
BopG VarG (AppG (fromList [EmptyG]))

(9,28)-(9,69)
0
LitG

(9,28)-(9,69)
match xs with
| [] -> 0
| h :: t -> h + sumList t
CaseG VarG (fromList [(Nothing,BopG EmptyG EmptyG),(Nothing,LitG)])

(9,61)-(9,67)
sumList
VarG

(9,61)-(9,67)
digits n
AppG (fromList [VarG])

*)
