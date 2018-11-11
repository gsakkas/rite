
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
      if (i + j) > 9
      then (1, ((i + j) - 10))
      else if (i + j) <= 9 then (0, (i + j)) in
    let base = (0, []) in
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
LetG NonRec [VarG] (TupleG [EmptyG,EmptyG])

(22,11)-(22,30)
a
VarG

(22,15)-(22,29)
((i + j) + s) / 10
BopG (BopG EmptyG EmptyG) LitG

(22,17)-(22,18)
i + j
BopG VarG VarG

(22,26)-(22,28)
s
VarG

(23,11)-(23,44)
s
VarG

(23,14)-(23,21)
((i + j) + s) mod 10
BopG (BopG EmptyG EmptyG) LitG

(23,14)-(23,26)
(((i + j) + s) mod 10) :: t
ConAppG (Just (TupleG [BopG (BopG (BopG VarG VarG) VarG) LitG,VarG])) Nothing

(24,4)-(26,51)
t
VarG

(24,4)-(26,51)
10
LitG

*)
