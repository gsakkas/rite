
let listReverse l =
  let rec reverseHelper l rl =
    match l with | [] -> rl | h::t -> reverseHelper t (h :: rl) in
  reverseHelper l [];;

let rec digitsOfInt n =
  let digOfInt n r =
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
AppG (fromList [CaseG EmptyG (fromList [(Nothing,EmptyG)])])

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
AppG (fromList [BopG EmptyG EmptyG])

(8,15)-(14,57)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

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
CaseG (BopG EmptyG EmptyG) (fromList [(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)])),(Nothing,ListG EmptyG Nothing)])

(8,15)-(14,57)
match n > 9 with
| false -> n :: (digitsOfInt (n / 10))
| true -> (n mod 10) :: (digitsOfInt (n / 10))
CaseG (BopG EmptyG EmptyG) (fromList [(Nothing,ConAppG (Just EmptyG) Nothing)])

(8,15)-(14,57)
n :: (digitsOfInt (n / 10))
ConAppG (Just (TupleG (fromList [VarG,AppG (fromList [BopG VarG LitG])]))) Nothing

(8,15)-(14,57)
(n mod 10) :: (digitsOfInt (n / 10))
ConAppG (Just (TupleG (fromList [AppG (fromList [BopG VarG LitG]),BopG VarG LitG]))) Nothing

(8,15)-(14,57)
[]
ListG EmptyG Nothing

(15,2)-(15,13)
digOfInt
VarG

(15,2)-(15,15)
fun n -> digOfInt n
LamG (AppG (fromList [EmptyG]))

*)
