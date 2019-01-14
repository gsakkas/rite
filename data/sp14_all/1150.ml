
let rec digitsOfInt n =
  if n < 0
  then []
  else if n < 10 then n else [digitsOfInt (n / 10); n mod 10];;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n = 0
    then [0]
    else
      if n > 10
      then digitsOfInt (n mod 10)
      else (let a = n mod 10 in let b = n / 10 in if b = 0 then [n] else [a]);;

*)

(* changed spans
(5,10)-(5,16)
n = 0
BopG VarG LitG

(5,14)-(5,16)
0
LitG

(5,22)-(5,23)
n > 10
BopG VarG LitG

(5,22)-(5,23)
0
LitG

(5,22)-(5,23)
if n > 10
then digitsOfInt (n mod 10)
else (let a = n mod 10 in
      let b = n / 10 in
      if b = 0 then [n] else [a])
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (LetG NonRec (fromList [EmptyG]) EmptyG)

(5,22)-(5,23)
[0]
ListG LitG Nothing

(5,29)-(5,61)
10
LitG

(5,42)-(5,50)
n mod 10
BopG VarG LitG

(5,52)-(5,60)
let a = n mod 10 in
let b = n / 10 in
if b = 0 then [n] else [a]
LetG NonRec (fromList [BopG EmptyG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

*)
