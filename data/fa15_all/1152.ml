
let rec digitsOfInt n =
  if n < 0
  then []
  else if n > 10 then [digitsOfInt (n / 10); n mod 10] else n;;


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
n
VarG

(5,10)-(5,16)
n = 0
BopG VarG LitG

(5,10)-(5,16)
0
LitG

(5,10)-(5,16)
0
LitG

(5,10)-(5,16)
if n > 10
then digitsOfInt (n mod 10)
else (let a = n mod 10 in
      let b = n / 10 in
      if b = 0 then [n] else [a])
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (LetG NonRec (fromList [EmptyG]) EmptyG)

(5,10)-(5,16)
[0]
ListG LitG Nothing

(5,35)-(5,43)
n mod 10
BopG VarG LitG

(5,45)-(5,53)
let a = n mod 10 in
let b = n / 10 in
if b = 0 then [n] else [a]
LetG NonRec (fromList [BopG EmptyG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(5,60)-(5,61)
n / 10
BopG VarG LitG

(5,60)-(5,61)
let b = n / 10 in
if b = 0 then [n] else [a]
LetG NonRec (fromList [BopG EmptyG EmptyG]) (IteG EmptyG EmptyG EmptyG)

*)
