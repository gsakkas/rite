
let listReverse l =
  let rec reverseHelper l rl =
    match l with | [] -> rl | h::t -> reverseHelper t (h :: rl) in
  reverseHelper l [];;

let rec digitsOfInt n =
  let digOfInt n =
    match n > 0 with
    | false  -> []
    | true  ->
        (match n > 9 with
         | false  -> n :: (digitsOfInt (n / 10))
         | true  -> (n mod 10) :: (digitsOfInt (n / 10))) in
  listReverse n;;


(* fix

let listReverse l =
  let rec reverseHelper l rl =
    match l with | [] -> rl | h::t -> reverseHelper t (h :: rl) in
  reverseHelper l [];;

let rec digitsOfInt n =
  listReverse
    (match n > 0 with
     | false  -> []
     | true  ->
         (match n > 9 with
          | false  -> n :: (digitsOfInt (n / 10))
          | true  -> (n mod 10) :: (digitsOfInt (n / 10))));;

let rec digOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with
       | false  -> n :: (digitsOfInt (n / 10))
       | true  -> (n mod 10) :: (digitsOfInt (n / 10)));;

let rec digitsOfInt n = digOfInt n;;

*)

(* changed spans
(8,2)-(15,15)
listReverse (match n > 0 with
             | false -> []
             | true -> match n > 9 with
                       | false -> n :: (digitsOfInt (n / 10))
                       | true -> (n mod 10) :: (digitsOfInt (n / 10)))
AppG [CaseG EmptyG [(Nothing,EmptyG),(Nothing,EmptyG)]]

(8,15)-(14,57)
listReverse
VarG

(8,15)-(14,57)
n
VarG

(8,15)-(14,57)
n
VarG

(8,15)-(14,57)
n
VarG

(8,15)-(14,57)
digitsOfInt
VarG

(8,15)-(14,57)
n
VarG

(8,15)-(14,57)
n
VarG

(8,15)-(14,57)
digitsOfInt
VarG

(8,15)-(14,57)
n
VarG

(8,15)-(14,57)
digitsOfInt (n / 10)
AppG [BopG EmptyG EmptyG]

(8,15)-(14,57)
digitsOfInt (n / 10)
AppG [BopG EmptyG EmptyG]

(8,15)-(14,57)
n > 0
BopG VarG LitG

(8,15)-(14,57)
n > 9
BopG VarG LitG

(8,15)-(14,57)
n / 10
BopG VarG LitG

(8,15)-(14,57)
n mod 10
BopG VarG LitG

(8,15)-(14,57)
n / 10
BopG VarG LitG

(8,15)-(14,57)
0
LitG

(8,15)-(14,57)
9
LitG

(8,15)-(14,57)
10
LitG

(8,15)-(14,57)
10
LitG

(8,15)-(14,57)
10
LitG

(8,15)-(14,57)
match n > 0 with
| false -> []
| true -> match n > 9 with
          | false -> n :: (digitsOfInt (n / 10))
          | true -> (n mod 10) :: (digitsOfInt (n / 10))
CaseG (BopG EmptyG EmptyG) [(Nothing,ListG EmptyG Nothing),(Nothing,CaseG EmptyG [(Nothing,EmptyG),(Nothing,EmptyG)])]

(8,15)-(14,57)
match n > 9 with
| false -> n :: (digitsOfInt (n / 10))
| true -> (n mod 10) :: (digitsOfInt (n / 10))
CaseG (BopG EmptyG EmptyG) [(Nothing,ConAppG (Just EmptyG) Nothing),(Nothing,ConAppG (Just EmptyG) Nothing)]

(8,15)-(14,57)
n :: (digitsOfInt (n / 10))
ConAppG (Just (TupleG [VarG,AppG [BopG VarG LitG]])) Nothing

(8,15)-(14,57)
(n mod 10) :: (digitsOfInt (n / 10))
ConAppG (Just (TupleG [BopG VarG LitG,AppG [BopG VarG LitG]])) Nothing

(8,15)-(14,57)
[]
ListG EmptyG Nothing

(15,2)-(15,13)
digOfInt
VarG

(15,2)-(15,15)
fun n -> digOfInt n
LamG (AppG [EmptyG])

*)
