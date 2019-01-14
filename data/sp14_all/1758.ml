
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let first = List.length l1 in
  let sec = List.length l2 in
  if first < sec
  then ((List.append (clone 0 (sec - first)) l1), l2)
  else
    if first > sec
    then (l1, (List.append (clone 0 (first - sec)) l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (i,j) = x in
      if (i + j) > 9 then (1, ((i + j) - 10)) else (0, (i + j)) in
    let base = [] in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let first = List.length l1 in
  let sec = List.length l2 in
  if first < sec
  then ((List.append (clone 0 (sec - first)) l1), l2)
  else
    if first > sec
    then (l1, (List.append (clone 0 (first - sec)) l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (i,j) = x in
      let (s,t) = a in ((((i + j) + s) / 10), ((((i + j) + s) mod 10) :: t)) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(21,19)-(21,20)
let (s , t) = a in
(((i + j) + s) / 10 , (((i + j) + s) mod 10) :: t)
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(21,26)-(21,45)
a
VarG

(21,30)-(21,44)
((i + j) + s) / 10
BopG (BopG EmptyG EmptyG) LitG

(21,32)-(21,33)
i + j
BopG VarG VarG

(21,41)-(21,43)
s
VarG

(21,52)-(21,53)
(((i + j) + s) mod 10) :: t
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (BopG VarG VarG) VarG) LitG]))) Nothing

(21,55)-(21,62)
((i + j) + s) mod 10
BopG (BopG EmptyG EmptyG) LitG

(21,56)-(21,57)
i + j
BopG VarG VarG

(22,4)-(24,51)
s
VarG

(22,4)-(24,51)
t
VarG

(22,4)-(24,51)
10
LitG

(22,15)-(22,17)
0
LitG

(22,15)-(22,17)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

*)
