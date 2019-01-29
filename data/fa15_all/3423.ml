
let rec digitsOfInt n = (n mod 10) :: (if n <> [] then digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  let int list digInt = n mod 10 in
  if n > 0 then digitsOfInt (n / 10) else [];;

*)

(* changed spans
(2,24)-(2,34)
fun list ->
  fun digInt -> n mod 10
LamG (LamG EmptyG)

(2,24)-(2,34)
fun digInt -> n mod 10
LamG (BopG EmptyG EmptyG)

(2,24)-(2,76)
let int =
  fun list ->
    fun digInt -> n mod 10 in
if n > 0
then digitsOfInt (n / 10)
else []
LetG NonRec (fromList [LamG EmptyG]) (IteG EmptyG EmptyG EmptyG)

(2,39)-(2,75)
[]
ListG EmptyG Nothing

(2,42)-(2,49)
n > 0
BopG VarG LitG

(2,47)-(2,49)
0
LitG

*)
