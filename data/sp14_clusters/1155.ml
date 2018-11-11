
let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let a = n / 10 in
     let b = n mod 10 in
     let c = [a; b] in
     if a > 9 then match c with | x::xs -> [digitsOfInt x; xs]);;


(* fix

let rec digitsOfInt n =
  let rec integers a b =
    if a = 0 then b else integers (a / 10) ((a mod 10) :: b) in
  integers n [];;

*)

(* changed spans
(3,2)-(9,63)
fun a ->
  fun b ->
    if a = 0
    then b
    else integers (a / 10)
                  ((a mod 10) :: b)
LamG (LamG EmptyG)

(3,2)-(9,63)
fun b ->
  if a = 0
  then b
  else integers (a / 10)
                ((a mod 10) :: b)
LamG (IteG EmptyG EmptyG EmptyG)

(3,2)-(9,63)
let rec integers =
  fun a ->
    fun b ->
      if a = 0
      then b
      else integers (a / 10)
                    ((a mod 10) :: b) in
integers n []
LetG Rec [LamG EmptyG] (AppG [EmptyG,EmptyG])

(3,5)-(3,6)
a = 0
BopG VarG LitG

(3,9)-(3,10)
a
VarG

(6,4)-(9,63)
b
VarG

(6,13)-(6,14)
a
VarG

(6,13)-(6,19)
integers
VarG

(6,13)-(6,19)
integers (a / 10)
         ((a mod 10) :: b)
AppG [BopG EmptyG EmptyG,ConAppG (Just EmptyG) Nothing]

(7,5)-(9,62)
(a mod 10) :: b
ConAppG (Just (TupleG [BopG VarG LitG,VarG])) Nothing

(8,17)-(8,18)
10
LitG

(9,5)-(9,62)
integers n []
AppG [VarG,ListG EmptyG Nothing]

*)
