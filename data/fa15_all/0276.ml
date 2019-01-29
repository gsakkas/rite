
let rec digitsOfInt n =
  match n with | 0 -> [] | _ -> [n mod 10; digitsOfInt (n / 10)];;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,2)-(3,64)
if n <= 0
then []
else (n mod 10) :: (digitsOfInt (n / 10))
IteG (BopG EmptyG EmptyG) (ListG EmptyG Nothing) (ConAppG (Just EmptyG) Nothing)

(3,8)-(3,9)
n <= 0
BopG VarG LitG

(3,22)-(3,24)
0
LitG

(3,32)-(3,64)
(n mod 10) :: (digitsOfInt (n / 10))
ConAppG (Just (TupleG (fromList [AppG (fromList [BopG VarG LitG]),BopG VarG LitG]))) Nothing

*)
