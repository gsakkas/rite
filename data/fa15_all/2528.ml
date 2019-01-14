
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
    let f a x = a + x in
    let base = 0 in
    let args = List.combine l1 l2 in
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
(15,16)-(15,17)
let (x1 , x2) = x in
let (a1 , a2) = a in
if (x1 + x2) > 10
then (1 , (((x1 + x2) + a1) - 10) :: a2)
else (0 , ((x1 + x2) + a1) :: a2)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(16,4)-(18,51)
a
VarG

(16,4)-(18,51)
x1
VarG

(16,4)-(18,51)
x2
VarG

(16,4)-(18,51)
x1
VarG

(16,4)-(18,51)
x2
VarG

(16,4)-(18,51)
a1
VarG

(16,4)-(18,51)
a2
VarG

(16,4)-(18,51)
x1
VarG

(16,4)-(18,51)
x2
VarG

(16,4)-(18,51)
a1
VarG

(16,4)-(18,51)
a2
VarG

(16,4)-(18,51)
x1 + x2
BopG VarG VarG

(16,4)-(18,51)
(x1 + x2) > 10
BopG (BopG EmptyG EmptyG) LitG

(16,4)-(18,51)
((x1 + x2) + a1) - 10
BopG (BopG EmptyG EmptyG) LitG

(16,4)-(18,51)
(x1 + x2) + a1
BopG (BopG EmptyG EmptyG) VarG

(16,4)-(18,51)
x1 + x2
BopG VarG VarG

(16,4)-(18,51)
(x1 + x2) + a1
BopG (BopG EmptyG EmptyG) VarG

(16,4)-(18,51)
x1 + x2
BopG VarG VarG

(16,4)-(18,51)
10
LitG

(16,4)-(18,51)
1
LitG

(16,4)-(18,51)
10
LitG

(16,4)-(18,51)
0
LitG

(16,4)-(18,51)
let (a1 , a2) = a in
if (x1 + x2) > 10
then (1 , (((x1 + x2) + a1) - 10) :: a2)
else (0 , ((x1 + x2) + a1) :: a2)
LetG NonRec (fromList [VarG]) (IteG EmptyG EmptyG EmptyG)

(16,4)-(18,51)
if (x1 + x2) > 10
then (1 , (((x1 + x2) + a1) - 10) :: a2)
else (0 , ((x1 + x2) + a1) :: a2)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(16,4)-(18,51)
(1 , (((x1 + x2) + a1) - 10) :: a2)
TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (BopG VarG VarG) VarG) LitG]))) Nothing])

(16,4)-(18,51)
(0 , ((x1 + x2) + a1) :: a2)
TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG,BopG (BopG VarG VarG) VarG]))) Nothing])

(16,4)-(18,51)
(((x1 + x2) + a1) - 10) :: a2
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (BopG VarG VarG) VarG) LitG]))) Nothing

(16,4)-(18,51)
((x1 + x2) + a1) :: a2
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG VarG VarG) VarG]))) Nothing

(16,15)-(16,16)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(17,4)-(18,51)
[]
ListG EmptyG Nothing

(17,15)-(17,33)
List.rev
VarG

(17,15)-(17,33)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

*)
