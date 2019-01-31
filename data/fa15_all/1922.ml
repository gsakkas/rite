
let rec digitsOfInt n =
  if n < 0 then [] else (n mod 10) :: ([(digitsOfInt n) / 1] 0);;


(* fix

let rec digitsOfInt n =
  if n < 0 then print_int 0 else print_int (n / 10); digitsOfInt (n / 10);;

*)

(* changed spans
(3,2)-(3,63)
if n < 0
then print_int 0
else print_int (n / 10);
digitsOfInt (n / 10)
SeqG (IteG EmptyG EmptyG EmptyG) (AppG (fromList [EmptyG]))

(3,39)-(3,60)
print_int
VarG

(3,40)-(3,55)
n
VarG

(3,40)-(3,55)
10
LitG

(3,40)-(3,59)
print_int
VarG

(3,40)-(3,59)
print_int (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

(3,40)-(3,59)
0
LitG

(3,53)-(3,54)
n / 10
BopG VarG LitG

(3,61)-(3,62)
10
LitG

*)
