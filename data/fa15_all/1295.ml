
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  if difference2 > 0
  then (((clone 0 difference2) @ l1), l2)
  else
    if difference1 > 0 then (l1, ((clone 0 difference1) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> if h = 0 then removeZero t else h :: (removeZero t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = ((a + x), (a + x)) in
    let base = (0, 0) in
    let args = l1 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  if difference2 > 0
  then (((clone 0 difference2) @ l1), l2)
  else
    if difference1 > 0 then (l1, ((clone 0 difference1) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> if h = 0 then removeZero t else h :: (removeZero t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,temp) = a in
      let s = (x1 + x2) + carry in
      let carry' = s / 10 in
      let rem = s mod 10 in
      let acc = rem :: temp in
      if (List.length acc) = (List.length l1)
      then (0, (carry' :: acc))
      else (carry', acc) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,18)-(19,19)
let (x1 , x2) = x in
let (carry , temp) = a in
let s = (x1 + x2) + carry in
let carry' = s / 10 in
let rem = s mod 10 in
let acc = rem :: temp in
if List.length acc = List.length l1
then (0 , carry' :: acc)
else (carry' , acc)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(19,26)-(19,33)
let (carry , temp) = a in
let s = (x1 + x2) + carry in
let carry' = s / 10 in
let rem = s mod 10 in
let acc = rem :: temp in
if List.length acc = List.length l1
then (0 , carry' :: acc)
else (carry' , acc)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(20,4)-(21,68)
let s = (x1 + x2) + carry in
let carry' = s / 10 in
let rem = s mod 10 in
let acc = rem :: temp in
if List.length acc = List.length l1
then (0 , carry' :: acc)
else (carry' , acc)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(20,15)-(20,21)
x1
VarG

(20,15)-(20,21)
x2
VarG

(20,15)-(20,21)
carry
VarG

(20,15)-(20,21)
s
VarG

(20,15)-(20,21)
s
VarG

(20,15)-(20,21)
rem
VarG

(20,15)-(20,21)
temp
VarG

(20,15)-(20,21)
List.length
VarG

(20,15)-(20,21)
acc
VarG

(20,15)-(20,21)
List.length
VarG

(20,15)-(20,21)
l1
VarG

(20,15)-(20,21)
List.length acc
AppG (fromList [VarG])

(20,15)-(20,21)
List.length l1
AppG (fromList [VarG])

(20,15)-(20,21)
x1 + x2
BopG VarG VarG

(20,15)-(20,21)
(x1 + x2) + carry
BopG (BopG EmptyG EmptyG) VarG

(20,15)-(20,21)
s / 10
BopG VarG LitG

(20,15)-(20,21)
s mod 10
BopG VarG LitG

(20,15)-(20,21)
List.length acc = List.length l1
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(20,15)-(20,21)
10
LitG

(20,15)-(20,21)
10
LitG

(20,15)-(20,21)
let carry' = s / 10 in
let rem = s mod 10 in
let acc = rem :: temp in
if List.length acc = List.length l1
then (0 , carry' :: acc)
else (carry' , acc)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(20,15)-(20,21)
let rem = s mod 10 in
let acc = rem :: temp in
if List.length acc = List.length l1
then (0 , carry' :: acc)
else (carry' , acc)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(20,15)-(20,21)
let acc = rem :: temp in
if List.length acc = List.length l1
then (0 , carry' :: acc)
else (carry' , acc)
LetG NonRec (fromList [ConAppG (Just EmptyG) Nothing]) (IteG EmptyG EmptyG EmptyG)

(20,15)-(20,21)
if List.length acc = List.length l1
then (0 , carry' :: acc)
else (carry' , acc)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(20,15)-(20,21)
rem :: temp
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(20,19)-(20,20)
carry'
VarG

(20,19)-(20,20)
acc
VarG

(20,19)-(20,20)
carry'
VarG

(20,19)-(20,20)
acc
VarG

(20,19)-(20,20)
let base = (0 , []) in
let args =
  List.rev (List.combine l1
                         l2) in
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [TupleG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(20,19)-(20,20)
(carry' , acc)
TupleG (fromList [VarG])

(20,19)-(20,20)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(20,19)-(20,20)
carry' :: acc
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(21,4)-(21,68)
[]
ListG EmptyG Nothing

(21,15)-(21,17)
List.rev
VarG

(21,15)-(21,17)
List.combine
VarG

(21,15)-(21,17)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(21,15)-(21,17)
List.combine l1 l2
AppG (fromList [VarG])

(21,21)-(21,68)
l2
VarG

*)
