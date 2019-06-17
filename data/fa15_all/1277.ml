
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n <= 0
  then []
  else if n < 10 then 0 else 1 + (additivePersistence sumList (digits n));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10 then 0 else 1 + (additivePersistence (sumList (digits n)));;

*)

(* changed spans
(10,6)-(10,12)
n < 10
BopG VarG LitG

(11,8)-(11,10)
0
LitG

(12,8)-(12,74)
1 + additivePersistence (sumList (digits n))
BopG LitG (AppG [EmptyG])

*)

(* type error slice
(10,3)-(12,74)
(11,8)-(11,10)
(12,8)-(12,74)
(12,30)-(12,74)
*)
