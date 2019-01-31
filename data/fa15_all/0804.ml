
let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n < 10 then [n] else (let d = digitsOfInt (n / 10) in [d; n mod 10]);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n < 10
    then [n]
    else (let d::[] = digitsOfInt (n / 10) in [d; n mod 10]);;

*)

(* changed spans
(6,28)-(6,75)
let d :: [] =
  digitsOfInt (n / 10) in
[d ; n mod 10]
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (ListG EmptyG Nothing)

*)
