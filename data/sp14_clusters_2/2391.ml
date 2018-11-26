
let rec digOfIntHelper h = match h > 0 with | true  -> 1 | false  -> 0;;

let rec digitsOfInt n =
  match n > 0 with | true  -> [digOfIntHelper n; []; n mod 10] | false  -> [];;


(* fix

let rec digitsOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with
       | false  -> n :: (digitsOfInt n)
       | true  -> digitsOfInt (n mod 10));;

*)

(* changed spans
(5,2)-(5,77)
match n > 0 with
| false -> []
| true -> match n > 9 with
          | false -> n :: (digitsOfInt n)
          | true -> digitsOfInt (n mod 10)
CaseG (BopG EmptyG EmptyG) (fromList [(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)])),(Nothing,ListG EmptyG Nothing)])

(5,30)-(5,62)
[]
ListG EmptyG Nothing

(5,31)-(5,45)
digitsOfInt
VarG

(5,31)-(5,47)
n
VarG

(5,31)-(5,47)
n
VarG

(5,31)-(5,47)
n > 9
BopG VarG LitG

(5,31)-(5,47)
9
LitG

(5,31)-(5,47)
match n > 9 with
| false -> n :: (digitsOfInt n)
| true -> digitsOfInt (n mod 10)
CaseG (BopG EmptyG EmptyG) (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ConAppG (Just EmptyG) Nothing)])

(5,31)-(5,47)
n :: (digitsOfInt n)
ConAppG (Just (TupleG (fromList [VarG,AppG (fromList [VarG])]))) Nothing

(5,49)-(5,51)
digitsOfInt (n mod 10)
AppG (fromList [BopG EmptyG EmptyG])

(5,53)-(5,61)
digitsOfInt
VarG

*)
