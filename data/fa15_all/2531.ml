
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | [] -> []
      | h::t -> let (j,k) = x in if (j + k) > 10 then 1 :: h else 0 :: h in
    let base = (0, 0) in
    let args = List.combine (List.rev l1; List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      if (x1 + x2) > 10
      then (1, ((((x1 + x2) + a1) - 10) :: a2))
      else (0, (((x1 + x2) + a1) :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,16)-(18,72)
let (x1 , x2) = x in
let (a1 , a2) = a in
if (x1 + x2) > 10
then (1 , (((x1 + x2) + a1) - 10) :: a2)
else (0 , ((x1 + x2) + a1) :: a2)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(18,33)-(18,72)
a
VarG

(18,33)-(18,72)
let (a1 , a2) = a in
if (x1 + x2) > 10
then (1 , (((x1 + x2) + a1) - 10) :: a2)
else (0 , ((x1 + x2) + a1) :: a2)
LetG NonRec (fromList [VarG]) (IteG EmptyG EmptyG EmptyG)

(18,41)-(18,42)
x1
VarG

(18,46)-(18,48)
x2
VarG

(18,54)-(18,60)
(1 , (((x1 + x2) + a1) - 10) :: a2)
TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (BopG VarG VarG) VarG) LitG]))) Nothing])

(18,66)-(18,67)
x1
VarG

(18,66)-(18,67)
x2
VarG

(18,66)-(18,67)
a1
VarG

(18,66)-(18,67)
a2
VarG

(18,66)-(18,67)
((x1 + x2) + a1) - 10
BopG (BopG EmptyG EmptyG) LitG

(18,66)-(18,67)
(x1 + x2) + a1
BopG (BopG EmptyG EmptyG) VarG

(18,66)-(18,67)
x1 + x2
BopG VarG VarG

(18,66)-(18,67)
10
LitG

(18,66)-(18,67)
(0 , ((x1 + x2) + a1) :: a2)
TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG,BopG (BopG VarG VarG) VarG]))) Nothing])

(18,71)-(18,72)
((x1 + x2) + a1) :: a2
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG VarG VarG) VarG]))) Nothing

(19,4)-(21,51)
x1
VarG

(19,4)-(21,51)
x2
VarG

(19,4)-(21,51)
a1
VarG

(19,4)-(21,51)
a2
VarG

(19,4)-(21,51)
(x1 + x2) + a1
BopG (BopG EmptyG EmptyG) VarG

(19,4)-(21,51)
x1 + x2
BopG VarG VarG

(19,19)-(19,20)
[]
ListG EmptyG Nothing

(20,38)-(20,40)
List.combine
VarG

(20,38)-(20,40)
List.combine l1 l2
AppG (fromList [VarG])

*)
