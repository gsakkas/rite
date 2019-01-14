
let rec myAppend l n = match l with | [] -> [n] | h::t -> h :: (myAppend t n);;

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
(7,10)-(7,15)
match n with
| 0 -> []
| _ -> myAppend (getDigits (n / 10))
                (n mod 10)
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG Nothing)])

(7,21)-(7,29)
myAppend (getDigits (n / 10))
         (n mod 10)
AppG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

(7,21)-(7,61)
[]
ListG EmptyG Nothing

(7,30)-(7,41)
getDigits (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

(7,42)-(7,50)
getDigits
VarG

(7,67)-(7,69)
fun n ->
  if n = 0
  then [0]
  else getDigits n
LamG (IteG EmptyG EmptyG EmptyG)

*)
