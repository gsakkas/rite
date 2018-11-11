
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
      match x with
      | (i,j) -> if (i + j) > 9 then (1, ((i + j) - 10)) else (0, (i + j))
      | _ -> a in
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
(20,6)-(22,14)
let (i , j) = x in
let (s , t) = a in
(((i + j) + s) / 10 , (((i + j) + s) mod 10) :: t)
LetG NonRec [VarG] (LetG NonRec [EmptyG] EmptyG)

(21,30)-(21,31)
let (s , t) = a in
(((i + j) + s) / 10 , (((i + j) + s) mod 10) :: t)
LetG NonRec [VarG] (TupleG [EmptyG,EmptyG])

(21,37)-(21,56)
a
VarG

(21,41)-(21,55)
((i + j) + s) / 10
BopG (BopG EmptyG EmptyG) LitG

(21,43)-(21,44)
i + j
BopG VarG VarG

(21,52)-(21,54)
s
VarG

(21,63)-(21,64)
(((i + j) + s) mod 10) :: t
ConAppG (Just (TupleG [BopG (BopG (BopG VarG VarG) VarG) LitG,VarG])) Nothing

(21,66)-(21,73)
((i + j) + s) mod 10
BopG (BopG EmptyG EmptyG) LitG

(21,67)-(21,68)
i + j
BopG VarG VarG

(22,13)-(22,14)
s
VarG

(23,4)-(25,51)
t
VarG

(23,4)-(25,51)
10
LitG

(23,15)-(23,17)
0
LitG

(23,15)-(23,17)
(0 , [])
TupleG [LitG,ListG EmptyG Nothing]

*)
