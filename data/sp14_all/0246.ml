
let rec digitsOfInt n = if n > 0 then (n + (digitsOfInt n)) - 1;;


(* fix

let rec digitsOfInt n =
  if n > 0
  then []
  else
    (let (x,y) = ((n mod 10), (n / 10)) in
     if x < 10 then [x] else x :: (digitsOfInt y));;

*)

(* changed spans
(2,39)-(2,64)
[]
ListG (fromList [])

(2,64)-(2,64)
let (x , y) =
  (n mod 10 , n / 10) in
if x < 10
then [x]
else x :: (digitsOfInt y)
LetG NonRec (fromList [(TuplePatG (fromList [VarPatG]),TupleG (fromList [EmptyG]))]) (IteG EmptyG EmptyG EmptyG)

*)

(* type error slice
(2,25)-(2,64)
(2,39)-(2,64)
(2,64)-(2,64)
*)
