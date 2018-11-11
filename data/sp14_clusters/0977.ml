
let rec digitsOfInt n =
  if n <= 0
  then []
  else
    if (n mod 10) = 0
    then 0 :: (digitsOfInt (n / 10))
    else
      if ((n - 1) mod 10) = 0
      then 1 :: (digitsOfInt ((n - 1) / 10))
      else
        if ((n - 2) mod 10) = 0
        then 1 :: (digitsOfInt ((n - 2) / 10))
        else
          if ((n - 3) mod 10) = 0
          then 1 :: (digitsOfInt ((n - 3) / 10))
          else
            if ((n - 4) mod 10) = 0
            then 1 :: (digitsOfInt ((n - 4) / 10))
            else
              if ((n - 5) mod 10) = 0
              then 1 :: (digitsOfInt ((n - 5) / 10))
              else
                if ((n - 6) mod 10) = 0
                then 1 :: (digitsOfInt ((n - 6) / 10))
                else
                  if ((n - 7) mod 10) = 0
                  then 1 :: (digitsOfInt ((n - 7) / 10))
                  else
                    if ((n - 8) mod 10) = 0
                    then 1 :: (digitsOfInt ((n - 8) / 10))
                    else
                      if ((n - 9) mod 10) = 0
                      then 1 :: (digitsOfInt ((n - 9) / 10));;


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

(22,48)-(22,50)
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

(24,16)-(34,60)
fun n ->
  fun digitList ->
    if n = 0
    then digitList
    else digits (n / 10)
                ((n mod 10) :: digitList)
LamG (LamG EmptyG)

(24,16)-(34,60)
fun digitList ->
  if n = 0
  then digitList
  else digits (n / 10)
              ((n mod 10) :: digitList)
LamG (IteG EmptyG EmptyG EmptyG)

(25,27)-(25,38)
digitList
VarG

(25,39)-(25,53)
digits
VarG

(25,39)-(25,53)
digits (n / 10)
       ((n mod 10) :: digitList)
AppG [BopG EmptyG EmptyG,ConAppG (Just EmptyG) Nothing]

(33,22)-(34,60)
[]
ListG EmptyG Nothing

(33,26)-(33,33)
digitList
VarG

(33,27)-(33,28)
match n with
| 0 -> [0]
| _ -> digits n []
CaseG VarG [(Nothing,ListG EmptyG Nothing),(Nothing,AppG [EmptyG,EmptyG])]

(33,38)-(33,40)
[0]
ListG LitG Nothing

(34,46)-(34,53)
digits n []
AppG [VarG,ListG EmptyG Nothing]

(34,47)-(34,48)
digits
VarG

*)
