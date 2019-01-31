
let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n ->
      if n < 0
      then (((clone 0 (n * (-1))) @ l1), l2)
      else (((clone 0 n) @ l2), l1);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (b,c) -> if (b + c) > 9 then (((b + c) - 10), 1) else ((b + c), 0) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n ->
      if n < 0
      then (((clone 0 (n * (-1))) @ l1), l2)
      else (((clone 0 n) @ l2), l1);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (fst,sec) = x in
      let (fst',sec') =
        if (fst + sec) > 9 then (((fst + sec) - 10), 1) else ((fst + sec), 0) in
      let (carry,digits) = a in
      let (carry',digits') =
        if sec' = 1 then (1, (digits @ [fst'])) else (0, (digits @ [fst'])) in
      (carry', digits') in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,6)-(20,74)
let (fst , sec) = x in
let (fst' , sec') =
  if (fst + sec) > 9
  then ((fst + sec) - 10 , 1)
  else (fst + sec , 0) in
let (carry , digits) = a in
let (carry' , digits') =
  if sec' = 1
  then (1 , digits @ [fst'])
  else (0 , digits @ [fst']) in
(carry' , digits')
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(20,17)-(20,74)
let (fst' , sec') =
  if (fst + sec) > 9
  then ((fst + sec) - 10 , 1)
  else (fst + sec , 0) in
let (carry , digits) = a in
let (carry' , digits') =
  if sec' = 1
  then (1 , digits @ [fst'])
  else (0 , digits @ [fst']) in
(carry' , digits')
LetG NonRec (fromList [IteG EmptyG EmptyG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(20,25)-(20,26)
fst
VarG

(20,30)-(20,31)
sec
VarG

(20,44)-(20,45)
fst
VarG

(20,49)-(20,51)
sec
VarG

(20,68)-(20,69)
fst
VarG

(20,72)-(20,73)
sec
VarG

(21,4)-(23,51)
a
VarG

(21,4)-(23,51)
sec'
VarG

(21,4)-(23,51)
digits
VarG

(21,4)-(23,51)
(@)
VarG

(21,4)-(23,51)
fst'
VarG

(21,4)-(23,51)
digits
VarG

(21,4)-(23,51)
(@)
VarG

(21,4)-(23,51)
fst'
VarG

(21,4)-(23,51)
carry'
VarG

(21,4)-(23,51)
digits'
VarG

(21,4)-(23,51)
digits @ [fst']
AppG (fromList [VarG,ListG EmptyG Nothing])

(21,4)-(23,51)
digits @ [fst']
AppG (fromList [VarG,ListG EmptyG Nothing])

(21,4)-(23,51)
sec' = 1
BopG VarG LitG

(21,4)-(23,51)
1
LitG

(21,4)-(23,51)
1
LitG

(21,4)-(23,51)
0
LitG

(21,4)-(23,51)
let (carry , digits) = a in
let (carry' , digits') =
  if sec' = 1
  then (1 , digits @ [fst'])
  else (0 , digits @ [fst']) in
(carry' , digits')
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(21,4)-(23,51)
let (carry' , digits') =
  if sec' = 1
  then (1 , digits @ [fst'])
  else (0 , digits @ [fst']) in
(carry' , digits')
LetG NonRec (fromList [IteG EmptyG EmptyG EmptyG]) (TupleG (fromList [EmptyG]))

(21,4)-(23,51)
if sec' = 1
then (1 , digits @ [fst'])
else (0 , digits @ [fst'])
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(21,4)-(23,51)
(1 , digits @ [fst'])
TupleG (fromList [AppG (fromList [EmptyG]),LitG])

(21,4)-(23,51)
(0 , digits @ [fst'])
TupleG (fromList [AppG (fromList [EmptyG]),LitG])

(21,4)-(23,51)
(carry' , digits')
TupleG (fromList [VarG])

(21,4)-(23,51)
[fst']
ListG VarG Nothing

(21,4)-(23,51)
[fst']
ListG VarG Nothing

(22,15)-(22,44)
(@)
VarG

(22,15)-(22,44)
List.rev (List.combine l1
                       l2) @ [(0 , 0)]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(23,4)-(23,51)
0
LitG

(23,4)-(23,51)
0
LitG

(23,4)-(23,51)
(0 , 0)
TupleG (fromList [LitG])

(23,4)-(23,51)
[(0 , 0)]
ListG (TupleG (fromList [EmptyG])) Nothing

*)
