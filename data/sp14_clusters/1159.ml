
let rec digitsOfInt n =
  let rec integers a b =
    match a with | [] -> b | x::xs -> integers xs ((a mod 10) :: b) in
  integers n [];;


(* fix

let rec digitsOfInt n =
  let rec integers a b =
    if a = 0 then b else integers (a / 10) ((a mod 10) :: b) in
  integers n [];;

*)

(* changed spans
(4,4)-(4,67)
if a = 0
then b
else integers (a / 10)
              ((a mod 10) :: b)
IteG (BopG EmptyG EmptyG) VarG (AppG [EmptyG,EmptyG])

(4,10)-(4,11)
a = 0
BopG VarG LitG

(4,25)-(4,26)
0
LitG

(4,47)-(4,49)
a / 10
BopG VarG LitG

(4,50)-(4,67)
a
VarG

(4,50)-(4,67)
10
LitG

*)
