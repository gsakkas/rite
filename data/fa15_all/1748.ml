
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
    let f a x = a + x in
    let base = (0, 0) in
    let args =
      let combo = List.combine (List.rev l1) (List.rev l2) in
      match combo with
      | (i,j) -> if (i + j) > 9 then (1, ((i + j) - 10)) else (0, (i + j))
      | [] -> (0, 0) in
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
(19,16)-(19,17)
let (i , j) = x in
let (s , t) = a in
(((i + j) + s) / 10 , (((i + j) + s) mod 10) :: t)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(20,4)-(26,51)
a
VarG

(20,4)-(26,51)
i
VarG

(20,4)-(26,51)
j
VarG

(20,4)-(26,51)
s
VarG

(20,4)-(26,51)
i
VarG

(20,4)-(26,51)
j
VarG

(20,4)-(26,51)
s
VarG

(20,4)-(26,51)
t
VarG

(20,4)-(26,51)
((i + j) + s) / 10
BopG (BopG EmptyG EmptyG) LitG

(20,4)-(26,51)
(i + j) + s
BopG (BopG EmptyG EmptyG) VarG

(20,4)-(26,51)
i + j
BopG VarG VarG

(20,4)-(26,51)
((i + j) + s) mod 10
BopG (BopG EmptyG EmptyG) LitG

(20,4)-(26,51)
(i + j) + s
BopG (BopG EmptyG EmptyG) VarG

(20,4)-(26,51)
i + j
BopG VarG VarG

(20,4)-(26,51)
10
LitG

(20,4)-(26,51)
10
LitG

(20,4)-(26,51)
let (s , t) = a in
(((i + j) + s) / 10 , (((i + j) + s) mod 10) :: t)
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(20,4)-(26,51)
(((i + j) + s) / 10 , (((i + j) + s) mod 10) :: t)
TupleG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG) Nothing])

(20,4)-(26,51)
(((i + j) + s) mod 10) :: t
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (BopG VarG VarG) VarG) LitG]))) Nothing

(20,19)-(20,20)
[]
ListG EmptyG Nothing

*)
