
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
    let f a x = failwith "to be implemented" in
    let base = failwith "to be implemented" in
    let args = List.rev List.combine l1 l2 in
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
(18,25)-(18,44)
match a with
| (o , []) -> (o , [x])
| (o , l) -> (o , x :: l)
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(19,4)-(21,51)
a
VarG

(19,4)-(21,51)
o
VarG

(19,4)-(21,51)
x
VarG

(19,4)-(21,51)
o
VarG

(19,4)-(21,51)
x
VarG

(19,4)-(21,51)
l
VarG

(19,4)-(21,51)
(o , [x])
TupleG (fromList [VarG,ListG EmptyG Nothing])

(19,4)-(21,51)
(o , x :: l)
TupleG (fromList [VarG,ConAppG (Just (TupleG (fromList [VarG]))) Nothing])

(19,4)-(21,51)
x :: l
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(19,4)-(21,51)
[x]
ListG VarG Nothing

(19,24)-(19,43)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(20,4)-(21,51)
0
LitG

(20,4)-(21,51)
[]
ListG EmptyG Nothing

(20,15)-(20,23)
a
VarG

(20,15)-(20,23)
b
VarG

(20,15)-(20,23)
List.map
VarG

(20,15)-(20,23)
combine
VarG

(20,15)-(20,23)
fun (a , b) -> a + b
LamG (BopG EmptyG EmptyG)

(20,15)-(20,23)
List.map combine
         (List.rev (List.combine l1
                                 l2))
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(20,15)-(20,23)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(20,15)-(20,23)
a + b
BopG VarG VarG

(20,15)-(20,42)
let combine =
  fun (a , b) -> a + b in
List.map combine
         (List.rev (List.combine l1
                                 l2))
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(20,24)-(20,36)
List.combine l1 l2
AppG (fromList [VarG])

*)