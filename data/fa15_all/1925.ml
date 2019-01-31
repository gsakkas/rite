
let rec digitsOfInt n =
  if n < 0 then print_int 0 else print_int digitsOfInt (n / 10);;


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

(3,33)-(3,63)
print_int (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

(3,43)-(3,54)
n
VarG

(3,43)-(3,54)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

(3,43)-(3,54)
n / 10
BopG VarG LitG

(3,43)-(3,54)
10
LitG

*)
