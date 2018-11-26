
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      let tens = (x1 + x2) + (carry / 10) in
      let ones = (x1 + x2) + (carry mod 10) in tens :: ones :: res in
    let base = ([0], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      if carry <> []
      then
        let ch::_ = carry in
        let tens = ((x1 + x2) + ch) / 10 in
        let ones = ((x1 + x2) + ch) mod 10 in ([tens], (tens :: ones :: res))
      else
        (let tens = (x1 + x2) / 10 in
         let ones = (x1 + x2) mod 10 in ([tens], (tens :: ones :: res))) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(22,6)-(23,66)
carry
VarG

(22,6)-(23,66)
carry
VarG

(22,6)-(23,66)
carry <> []
BopG VarG (ListG EmptyG Nothing)

(22,6)-(23,66)
let ch :: _ = carry in
let tens =
  ((x1 + x2) + ch) / 10 in
let ones =
  ((x1 + x2) + ch) mod 10 in
([tens] , tens :: (ones :: res))
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(22,6)-(23,66)
if carry <> []
then (let ch :: _ = carry in
      let tens =
        ((x1 + x2) + ch) / 10 in
      let ones =
        ((x1 + x2) + ch) mod 10 in
      ([tens] , tens :: (ones :: res)))
else (let tens =
        (x1 + x2) / 10 in
      let ones = (x1 + x2) mod 10 in
      ([tens] , tens :: (ones :: res)))
IteG (BopG EmptyG EmptyG) (LetG NonRec (fromList [EmptyG]) EmptyG) (LetG NonRec (fromList [EmptyG]) EmptyG)

(22,6)-(23,66)
[]
ListG EmptyG Nothing

(22,17)-(22,41)
((x1 + x2) + ch) / 10
BopG (BopG EmptyG EmptyG) LitG

(22,30)-(22,35)
ch
VarG

(23,17)-(23,43)
((x1 + x2) + ch) mod 10
BopG (BopG EmptyG EmptyG) LitG

(23,29)-(23,43)
ch
VarG

(23,29)-(23,43)
tens
VarG

(23,29)-(23,43)
tens
VarG

(23,29)-(23,43)
ones
VarG

(23,29)-(23,43)
res
VarG

(23,29)-(23,43)
x1
VarG

(23,29)-(23,43)
x2
VarG

(23,29)-(23,43)
x1 + x2
BopG VarG VarG

(23,29)-(23,43)
(x1 + x2) / 10
BopG (BopG EmptyG EmptyG) LitG

(23,29)-(23,43)
10
LitG

(23,29)-(23,43)
10
LitG

(23,29)-(23,43)
let tens = (x1 + x2) / 10 in
let ones = (x1 + x2) mod 10 in
([tens] , tens :: (ones :: res))
LetG NonRec (fromList [BopG EmptyG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(23,29)-(23,43)
let ones = (x1 + x2) mod 10 in
([tens] , tens :: (ones :: res))
LetG NonRec (fromList [BopG EmptyG EmptyG]) (TupleG (fromList [EmptyG]))

(23,29)-(23,43)
([tens] , tens :: (ones :: res))
TupleG (fromList [ConAppG (Just EmptyG) Nothing,ListG EmptyG Nothing])

(23,29)-(23,43)
tens :: (ones :: res)
ConAppG (Just (TupleG (fromList [VarG,ConAppG (Just (TupleG (fromList [VarG]))) Nothing]))) Nothing

(23,29)-(23,43)
ones :: res
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(23,29)-(23,43)
[tens]
ListG VarG Nothing

(23,30)-(23,35)
x1 + x2
BopG VarG VarG

(23,40)-(23,42)
x1
VarG

(23,40)-(23,42)
x2
VarG

(23,47)-(23,66)
tens
VarG

(23,47)-(23,66)
([tens] , tens :: (ones :: res))
TupleG (fromList [ConAppG (Just EmptyG) Nothing,ListG EmptyG Nothing])

(23,47)-(23,66)
[tens]
ListG VarG Nothing

(25,4)-(26,51)
[]
ListG EmptyG Nothing

*)
