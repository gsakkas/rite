
let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then clone (l1, (0 :: l2))
  else
    if (List.length l1) < (List.length l2)
    then clone ((0 :: l1), l2)
    else (l1, l2);;


(* fix

let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then
    let l1G = (List.length l1) - (List.length l2) in
    (l1, (List.append (clone 0 l1G) l2))
  else
    if (List.length l1) < (List.length l2)
    then
      (let l2G = (List.length l2) - (List.length l1) in
       ((List.append (clone 0 l2G) l1), l2))
    else (l1, l2);;

*)

(* changed spans
(6,7)-(6,12)
List.length
VarG

(6,7)-(6,28)
List.length l1 - List.length l2
BopG (AppG [EmptyG]) (AppG [EmptyG])

(6,7)-(6,28)
let l1G =
  List.length l1 - List.length l2 in
(l1 , List.append (clone 0
                         l1G) l2)
LetG NonRec [BopG EmptyG EmptyG] (TupleG [EmptyG,EmptyG])

(6,13)-(6,28)
l1
VarG

(6,13)-(6,28)
List.length
VarG

(6,13)-(6,28)
l2
VarG

(6,13)-(6,28)
List.length l2
AppG [VarG]

(6,18)-(6,27)
List.append (clone 0 l1G) l2
AppG [AppG [EmptyG,EmptyG],VarG]

(6,19)-(6,20)
List.append
VarG

(6,19)-(6,20)
clone
VarG

(6,19)-(6,20)
clone 0 l1G
AppG [LitG,VarG]

(6,24)-(6,26)
l1G
VarG

(9,9)-(9,14)
List.length
VarG

(9,9)-(9,30)
List.length l2 - List.length l1
BopG (AppG [EmptyG]) (AppG [EmptyG])

(9,9)-(9,30)
let l2G =
  List.length l2 - List.length l1 in
(List.append (clone 0 l2G)
             l1 , l2)
LetG NonRec [BopG EmptyG EmptyG] (TupleG [EmptyG,EmptyG])

(9,15)-(9,30)
l2
VarG

(9,15)-(9,30)
List.length
VarG

(9,15)-(9,30)
l1
VarG

(9,15)-(9,30)
List.length l1
AppG [VarG]

(9,16)-(9,25)
List.append (clone 0 l2G) l1
AppG [AppG [EmptyG,EmptyG],VarG]

(9,17)-(9,18)
List.append
VarG

(9,17)-(9,18)
clone
VarG

(9,17)-(9,18)
clone 0 l2G
AppG [LitG,VarG]

(9,22)-(9,24)
l2G
VarG

*)
