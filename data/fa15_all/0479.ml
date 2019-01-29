
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
      match x with
      | (x1,x2)::(x3,x4)::t -> (x1 + (x2 mod 10)) :: a
      | (x1,x2)::[] -> (x1 + (x2 / 10)) :: (x1 + (x2 mod 10)) :: a in
    let base = [] in
    let args = List.combine l1 l2 in
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
      let (a1,a2) = a in
      let h::_ = a1 in
      let tens = (x1 + x2) + (h / 10) in
      let ones = (x1 + x2) + (h mod 10) in ((tens :: a1), (ones :: a2)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,6)-(22,66)
let (x1 , x2) = x in
let (a1 , a2) = a in
let h :: _ = a1 in
let tens =
  (x1 + x2) + (h / 10) in
let ones =
  (x1 + x2) + (h mod 10) in
(tens :: a1 , ones :: a2)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(21,45)-(21,47)
let (a1 , a2) = a in
let h :: _ = a1 in
let tens =
  (x1 + x2) + (h / 10) in
let ones =
  (x1 + x2) + (h mod 10) in
(tens :: a1 , ones :: a2)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(22,23)-(22,39)
a1
VarG

(22,23)-(22,39)
let tens =
  (x1 + x2) + (h / 10) in
let ones =
  (x1 + x2) + (h mod 10) in
(tens :: a1 , ones :: a2)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(22,23)-(22,66)
let h :: _ = a1 in
let tens =
  (x1 + x2) + (h / 10) in
let ones =
  (x1 + x2) + (h mod 10) in
(tens :: a1 , ones :: a2)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(22,24)-(22,26)
x1 + x2
BopG VarG VarG

(22,35)-(22,37)
h
VarG

(22,35)-(22,37)
h / 10
BopG VarG LitG

(22,43)-(22,66)
let ones =
  (x1 + x2) + (h mod 10) in
(tens :: a1 , ones :: a2)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (TupleG (fromList [EmptyG]))

(22,44)-(22,46)
x1 + x2
BopG VarG VarG

(22,57)-(22,59)
h
VarG

(22,57)-(22,59)
h mod 10
BopG VarG LitG

(22,65)-(22,66)
(tens :: a1 , ones :: a2)
TupleG (fromList [ConAppG (Just (TupleG (fromList [VarG]))) Nothing])

(23,4)-(25,51)
tens
VarG

(23,4)-(25,51)
a1
VarG

(23,4)-(25,51)
ones
VarG

(23,4)-(25,51)
a2
VarG

(23,4)-(25,51)
tens :: a1
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(23,4)-(25,51)
ones :: a2
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(23,15)-(23,17)
([] , [])
TupleG (fromList [ListG EmptyG Nothing])

(24,4)-(25,51)
[]
ListG EmptyG Nothing

(24,15)-(24,33)
List.rev
VarG

(24,15)-(24,33)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

*)
