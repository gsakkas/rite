
let rec myAppend list num =
  match list with | [] -> [num] | h::t -> h :: (myAppend t num);;

let rec digitsOfInt n =
  if n = 0
  then [0]
  else if n > 0 then myAppend digitsOfInt (n / 10) (n mod 10) else [];;


(* fix

let rec myAppend l n = match l with | [] -> [n] | h::t -> h :: (myAppend t n);;

let rec getDigits n =
  match n with | 0 -> [] | _ -> myAppend (getDigits (n / 10)) (n mod 10);;

let rec digitsOfInt n = if n = 0 then [0] else getDigits n;;

*)

(* changed spans
(2,22)-(3,63)
fun l ->
  fun n ->
    match l with
    | [] -> [n]
    | h :: t -> h :: (myAppend t
                               n)
LamG (LamG EmptyG)

(3,2)-(3,63)
fun n ->
  match l with
  | [] -> [n]
  | h :: t -> h :: (myAppend t
                             n)
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(3,8)-(3,12)
l
VarG

(3,27)-(3,30)
n
VarG

(8,10)-(8,11)
match n with
| 0 -> []
| _ -> myAppend (getDigits (n / 10))
                (n mod 10)
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG Nothing)])

(8,10)-(8,15)
fun n ->
  match n with
  | 0 -> []
  | _ -> myAppend (getDigits (n / 10))
                  (n mod 10)
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(8,21)-(8,29)
myAppend (getDigits (n / 10))
         (n mod 10)
AppG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

(8,21)-(8,61)
[]
ListG EmptyG Nothing

(8,30)-(8,41)
getDigits (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

(8,42)-(8,50)
getDigits
VarG

(8,67)-(8,69)
fun n ->
  if n = 0
  then [0]
  else getDigits n
LamG (IteG EmptyG EmptyG EmptyG)

*)
