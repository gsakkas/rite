
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let rec additivePersistence n =
  match n with | [] -> [] | h::t -> t + (digitsOfInt (additivePersistence h));;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10 then 1 else 1 + (additivePersistence (sumList (digitsOfInt n)));;

*)

(* changed spans
(5,28)-(6,77)
fun xs ->
  match xs with
  | [] -> 0
  | h :: t -> h + sumList t
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(6,23)-(6,25)
xs
VarG

(6,36)-(6,37)
h
VarG

(6,36)-(6,77)
0
LitG

(6,41)-(6,52)
sumList
VarG

(6,53)-(6,76)
t
VarG

(6,53)-(6,76)
n
VarG

(6,53)-(6,76)
fun n ->
  if n < 10
  then 1
  else 1 + additivePersistence (sumList (digitsOfInt n))
LamG (IteG EmptyG EmptyG EmptyG)

(6,53)-(6,76)
n < 10
BopG VarG LitG

(6,53)-(6,76)
1 + additivePersistence (sumList (digitsOfInt n))
BopG LitG (AppG (fromList [EmptyG]))

(6,53)-(6,76)
10
LitG

(6,53)-(6,76)
1
LitG

(6,53)-(6,76)
1
LitG

(6,53)-(6,76)
if n < 10
then 1
else 1 + additivePersistence (sumList (digitsOfInt n))
IteG (BopG EmptyG EmptyG) LitG (BopG EmptyG EmptyG)

(6,74)-(6,75)
sumList (digitsOfInt n)
AppG (fromList [AppG (fromList [EmptyG])])

*)
