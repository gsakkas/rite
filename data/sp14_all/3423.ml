
let rec digitsOfInt n = (n mod 10) :: (if n <> [] then digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  let int list digInt = n mod 10 in
  if n > 0 then digitsOfInt (n / 10) else [];;

*)

(* changed spans
(2,25)-(2,77)
let int =
  fun list ->
    fun digInt -> n mod 10 in
if n > 0
then digitsOfInt (n / 10)
else []
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (IteG EmptyG EmptyG EmptyG)

*)

(* type error slice
(2,4)-(2,79)
(2,21)-(2,77)
(2,25)-(2,35)
(2,25)-(2,77)
(2,26)-(2,27)
(2,39)-(2,77)
(2,43)-(2,44)
(2,43)-(2,50)
(2,48)-(2,50)
(2,56)-(2,67)
(2,56)-(2,76)
(2,76)-(2,76)
*)
