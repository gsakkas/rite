
let rec digitsOfInt n =
  if n <= 0
  then []
  else
    if (n mod 10) = 0
    then 0 :: (digitsOfInt (n / 10))
    else if ((n - 1) mod 10) = 0 then 1 :: (digitsOfInt ((n - 1) / 10));;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let rec digits n digitList =
       if n = 0 then digitList else digits (n / 10) ((n mod 10) :: digitList) in
     match n with | 0 -> [0] | _ -> digits n []);;

*)

(* changed spans
(3,5)-(3,11)
n < 0
BopG VarG LitG

(6,4)-(8,71)
fun n ->
  fun digitList ->
    if n = 0
    then digitList
    else digits (n / 10)
                ((n mod 10) :: digitList)
LamG (LamG EmptyG)

(6,4)-(8,71)
fun digitList ->
  if n = 0
  then digitList
  else digits (n / 10)
              ((n mod 10) :: digitList)
LamG (IteG EmptyG EmptyG EmptyG)

(6,4)-(8,71)
let rec digits =
  fun n ->
    fun digitList ->
      if n = 0
      then digitList
      else digits (n / 10)
                  ((n mod 10) :: digitList) in
match n with
| 0 -> [0]
| _ -> digits n []
LetG Rec [LamG EmptyG] (CaseG EmptyG [(Nothing,EmptyG),(Nothing,EmptyG)])

(7,15)-(7,26)
digitList
VarG

(7,27)-(7,35)
digits
VarG

(7,27)-(7,35)
digits (n / 10)
       ((n mod 10) :: digitList)
AppG [BopG EmptyG EmptyG,ConAppG (Just EmptyG) Nothing]

(8,9)-(8,71)
[]
ListG EmptyG Nothing

(8,12)-(8,32)
(n mod 10) :: digitList
ConAppG (Just (TupleG [BopG VarG LitG,VarG])) Nothing

(8,31)-(8,32)
digitList
VarG

(8,31)-(8,32)
n
VarG

(8,31)-(8,32)
match n with
| 0 -> [0]
| _ -> digits n []
CaseG VarG [(Nothing,ListG EmptyG Nothing),(Nothing,AppG [EmptyG,EmptyG])]

(8,31)-(8,32)
[0]
ListG LitG Nothing

(8,57)-(8,64)
digits n []
AppG [VarG,ListG EmptyG Nothing]

(8,58)-(8,59)
digits
VarG

*)
