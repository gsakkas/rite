
let rec help n = if n > 0 then (n mod 10) + (help (n / 10)) else 0;;

let rec digitsOfInt n =
  if n >= 10 then (n / (help n 1)) :: (digitsOfInt (n / 10)) else [n];;


(* fix

let rec helpFac a b = if (10 * a) > b then a else helpFac (10 * a) b;;

let rec digitsOfInt n =
  if n >= 10 then (n / (helpFac n 1)) :: (digitsOfInt (n / 10)) else [n];;

*)

(* changed spans
(2,13)-(2,66)
fun a ->
  fun b ->
    if (10 * a) > b
    then a
    else helpFac (10 * a) b
LamG (LamG EmptyG)

(2,17)-(2,66)
fun b ->
  if (10 * a) > b
  then a
  else helpFac (10 * a) b
LamG (IteG EmptyG EmptyG EmptyG)

(2,32)-(2,33)
10 * a
BopG LitG VarG

(2,51)-(2,52)
a
VarG

(2,55)-(2,57)
b
VarG

(2,55)-(2,57)
a
VarG

(2,55)-(2,57)
helpFac
VarG

(2,55)-(2,57)
helpFac (10 * a) b
AppG [BopG EmptyG EmptyG,VarG]

(2,55)-(2,57)
10 * a
BopG LitG VarG

(2,65)-(2,66)
a
VarG

(4,20)-(5,69)
b
VarG

(5,24)-(5,28)
helpFac
VarG

*)
