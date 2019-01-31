
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let addTuple (l1,l2) = l1 + l2;;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = (a + x) mod 10 in
    let base = [] in
    let args = List.map addTuple (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: res)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,16)-(19,30)
x
VarG

(19,16)-(19,30)
a
VarG

(19,16)-(19,30)
x1
VarG

(19,16)-(19,30)
x2
VarG

(19,16)-(19,30)
carry
VarG

(19,16)-(19,30)
((x1 + x2) + carry) / 10
BopG (BopG EmptyG EmptyG) LitG

(19,16)-(19,30)
(x1 + x2) + carry
BopG (BopG EmptyG EmptyG) VarG

(19,16)-(19,30)
x1 + x2
BopG VarG VarG

(19,16)-(19,30)
10
LitG

(19,16)-(19,30)
let (x1 , x2) = x in
let (carry , res) = a in
(((x1 + x2) + carry) / 10 , (((x1 + x2) + carry) mod 10) :: res)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(19,16)-(19,30)
let (carry , res) = a in
(((x1 + x2) + carry) / 10 , (((x1 + x2) + carry) mod 10) :: res)
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(19,16)-(19,30)
(((x1 + x2) + carry) / 10 , (((x1 + x2) + carry) mod 10) :: res)
TupleG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG) Nothing])

(19,16)-(19,30)
(((x1 + x2) + carry) mod 10) :: res
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (BopG VarG VarG) VarG) LitG]))) Nothing

(19,21)-(19,22)
x1 + x2
BopG VarG VarG

(19,28)-(19,30)
x1
VarG

(19,28)-(19,30)
x2
VarG

(19,28)-(19,30)
carry
VarG

(20,4)-(22,51)
res
VarG

(20,15)-(20,17)
0
LitG

(20,15)-(20,17)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(21,24)-(21,32)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(21,33)-(21,53)
List.rev
VarG

*)
