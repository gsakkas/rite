
let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let (x,y) = ((n mod 10), (n / 10)) in
     if n < 10 then [n] else x @ (digitsOfInt y));;


(* fix

let rec append x y = match y with | [] -> [x] | h::t -> h :: (append x t);;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let (x,y) = ((n mod 10), (n / 10)) in
     if n < 10 then [n] else append x (digitsOfInt y));;

*)

(* changed spans
(2,20)-(7,49)
y
VarG

(2,20)-(7,49)
x
VarG

(2,20)-(7,49)
h
VarG

(2,20)-(7,49)
append
VarG

(2,20)-(7,49)
x
VarG

(2,20)-(7,49)
t
VarG

(2,20)-(7,49)
fun x ->
  fun y ->
    match y with
    | [] -> [x]
    | h :: t -> h :: (append x t)
LamG (LamG EmptyG)

(2,20)-(7,49)
fun y ->
  match y with
  | [] -> [x]
  | h :: t -> h :: (append x t)
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(2,20)-(7,49)
append x t
AppG (fromList [VarG])

(2,20)-(7,49)
match y with
| [] -> [x]
| h :: t -> h :: (append x t)
CaseG VarG (fromList [(Nothing,ConAppG (Just EmptyG) Nothing),(Nothing,ListG EmptyG Nothing)])

(2,20)-(7,49)
h :: (append x t)
ConAppG (Just (TupleG (fromList [VarG,AppG (fromList [VarG])]))) Nothing

(2,20)-(7,49)
[x]
ListG VarG Nothing

(7,31)-(7,32)
append
VarG

*)
