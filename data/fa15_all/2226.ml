
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference = (List.length l1) - (List.length l2) in
  if difference > 0
  then (l1, ((clone 0 difference) @ l2))
  else
    if difference < 0
    then (((clone 0 ((-1) * difference)) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = match x with | (x1,x2) -> x1 + x2 in if sum < 10 then x :: a in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference = (List.length l1) - (List.length l2) in
  if difference > 0
  then (l1, ((clone 0 difference) @ l2))
  else
    if difference < 0
    then (((clone 0 ((-1) * difference)) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match a with | (o,[]) -> (o, [x]) | (o,l) -> (o, (x :: l)) in
    let base = (0, []) in
    let args =
      let combine (a,b) = a + b in
      List.map combine (List.rev (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,16)-(19,49)
match a with
| (o , []) -> (o , [x])
| (o , l) -> (o , x :: l)
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(19,22)-(19,23)
a
VarG

(19,22)-(19,23)
o
VarG

(19,22)-(19,23)
(o , [x])
TupleG (fromList [VarG,ListG EmptyG Nothing])

(19,22)-(19,23)
[x]
ListG VarG Nothing

(19,53)-(19,76)
l
VarG

(19,62)-(19,64)
(o , x :: l)
TupleG (fromList [VarG,ConAppG (Just (TupleG (fromList [VarG]))) Nothing])

(19,70)-(19,76)
o
VarG

(20,15)-(20,17)
0
LitG

(20,15)-(20,17)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(21,15)-(21,44)
a
VarG

(21,15)-(21,44)
b
VarG

(21,15)-(21,44)
List.map
VarG

(21,15)-(21,44)
combine
VarG

(21,15)-(21,44)
fun (a , b) -> a + b
LamG (BopG EmptyG EmptyG)

(21,15)-(21,44)
List.map combine
         (List.rev (List.combine l1
                                 l2))
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(21,15)-(21,44)
a + b
BopG VarG VarG

(21,15)-(21,44)
let combine =
  fun (a , b) -> a + b in
List.map combine
         (List.rev (List.combine l1
                                 l2))
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)
