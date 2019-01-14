
let modulus ss = ss mod 10;;

let rec digitsOfInt n =
  if n <= 0
  then []
  else (match n with | x -> (digitsOfInt (n / 10)) @ [modulus x]);;

let lt10 q = q < 10;;

let rec additivePersistence n = if lt10 n then n else [55] @ (digitsOfInt n);;


(* fix

let incre i = i + 1;;

let lt10 q = q < 10;;

let rec additivePersistence n =
  if lt10 n then n else (match n with | n -> incre n);;

*)

(* changed spans
(7,62)-(7,63)
fun i -> i + 1
LamG (BopG EmptyG EmptyG)

(9,9)-(9,19)
i
VarG

(9,9)-(9,19)
i + 1
BopG VarG LitG

(9,9)-(9,19)
1
LitG

(11,55)-(11,57)
match n with
| n -> incre n
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG]))])

(11,61)-(11,76)
n
VarG

(11,62)-(11,73)
incre
VarG

*)
