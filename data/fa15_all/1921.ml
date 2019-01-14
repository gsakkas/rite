
let rec digitsOfInt n =
  if n < 0 then [] else (n mod 10) :: ((digitsOfInt n) / 10);;


(* fix

let rec digitsOfInt n =
  if n < 0 then print_int 0 else print_int (n / 10); digitsOfInt (n / 10);;

*)

(* changed spans
(3,2)-(3,60)
if n < 0
then print_int 0
else print_int (n / 10);
digitsOfInt (n / 10)
SeqG (IteG EmptyG EmptyG EmptyG) (AppG (fromList [EmptyG]))

(3,24)-(3,34)
print_int 0
AppG (fromList [LitG])

(3,25)-(3,26)
print_int
VarG

(3,25)-(3,26)
print_int
VarG

(3,25)-(3,26)
print_int (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

(3,25)-(3,26)
n / 10
BopG VarG LitG

(3,25)-(3,26)
0
LitG

(3,52)-(3,53)
n / 10
BopG VarG LitG

*)
