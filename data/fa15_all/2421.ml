
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x = y
  then (l1, l2)
  else
    if x < y
    then (((clone 0 (y - x)) @ l1), l2)
    else (l1, ((clone 0 (x - y)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a in
    let base = [] in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x = y
  then (l1, l2)
  else
    if x < y
    then (((clone 0 (y - x)) @ l1), l2)
    else (l1, ((clone 0 (x - y)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (l1x,l2x) = x in let (a1,a2) = a in (a1, ((l1x + l2x) :: a2)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,16)-(19,17)
x
VarG

(19,16)-(19,17)
let (l1x , l2x) = x in
let (a1 , a2) = a in
(a1 , (l1x + l2x) :: a2)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(19,16)-(19,17)
let (a1 , a2) = a in
(a1 , (l1x + l2x) :: a2)
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(20,4)-(22,51)
a1
VarG

(20,4)-(22,51)
l1x
VarG

(20,4)-(22,51)
l2x
VarG

(20,4)-(22,51)
a2
VarG

(20,4)-(22,51)
l1x + l2x
BopG VarG VarG

(20,4)-(22,51)
(a1 , (l1x + l2x) :: a2)
TupleG (fromList [VarG,ConAppG (Just (TupleG (fromList [VarG,BopG VarG VarG]))) Nothing])

(20,4)-(22,51)
(l1x + l2x) :: a2
ConAppG (Just (TupleG (fromList [VarG,BopG VarG VarG]))) Nothing

(20,15)-(20,17)
([] , [])
TupleG (fromList [ListG EmptyG Nothing])

(21,4)-(22,51)
[]
ListG EmptyG Nothing

(21,15)-(21,33)
List.rev
VarG

(21,15)-(21,33)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

*)
