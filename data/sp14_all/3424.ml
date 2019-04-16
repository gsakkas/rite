
let rec digitsOfInt n = (n mod 10) :: (if n > 0 then digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  let int list digInt = n mod 10 in
  if n > 0 then digitsOfInt (n / 10) else [];;

*)

(* changed spans
(2,25)-(2,75)
let int =
  fun list ->
    fun digInt -> n mod 10 in
if n > 0
then digitsOfInt (n / 10)
else []
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (IteG EmptyG EmptyG EmptyG)

*)

(* type error slice
(2,4)-(2,77)
(2,21)-(2,75)
(2,25)-(2,75)
(2,39)-(2,75)
(2,54)-(2,65)
(2,54)-(2,74)
(2,74)-(2,74)
*)
