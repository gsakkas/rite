
let rec addList xs = match xs with | [] -> 0 | h::t -> h + (addList t);;

let rec digitsOfInt n =
  if n < 1 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec additivePersistence n =
  let count = 0 in
  if (List.length (digitsOfInt n)) = 1
  then count
  else count = (count + (1 additivePersistence (addList (digitsOfInt n))));;


(* fix

let rec addList xs = match xs with | [] -> 0 | h::t -> h + (addList t);;

let rec digitsOfInt n =
  if n < 1 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec addNum n = if n < 10 then n else addList (digitsOfInt n);;

let rec addHelp (count,n) =
  if n < 10 then count + 1 else addHelp ((count + 1), (addNum n));;

let rec additivePersistence n = addHelp (0, n);;

*)

(* changed spans
(9,5)-(9,34)
n
VarG

(9,5)-(9,34)
n
VarG

(9,5)-(9,34)
10
LitG

(9,5)-(9,38)
n < 10
BopG VarG LitG

(9,6)-(9,17)
addList
VarG

(11,7)-(11,12)
n
VarG

(11,7)-(11,12)
n < 10
BopG VarG LitG

(11,7)-(11,12)
count + 1
BopG VarG LitG

(11,7)-(11,12)
10
LitG

(11,7)-(11,12)
if n < 10
then count + 1
else addHelp (count + 1 , addNum n)
IteG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG) (AppG [EmptyG])

(11,7)-(11,74)
fun (count , n) ->
  if n < 10
  then count + 1
  else addHelp (count + 1 , addNum n)
LamG (IteG EmptyG EmptyG EmptyG)

(11,15)-(11,74)
addHelp
VarG

(11,15)-(11,74)
addHelp (count + 1 , addNum n)
AppG [TupleG [EmptyG,EmptyG]]

(11,15)-(11,74)
1
LitG

(11,15)-(11,74)
(count + 1 , addNum n)
TupleG [BopG EmptyG EmptyG,AppG [EmptyG]]

(11,48)-(11,55)
addNum
VarG

(11,56)-(11,71)
n
VarG

(11,56)-(11,71)
fun n -> addHelp (0 , n)
LamG (AppG [EmptyG])

(11,57)-(11,68)
addHelp
VarG

(11,69)-(11,70)
0
LitG

(11,69)-(11,70)
(0 , n)
TupleG [LitG,VarG]

*)
