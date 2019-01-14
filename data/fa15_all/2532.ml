
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
      | h::t ->
          let (j,k) = x in
          if (j + k) > 10
          then ((j = 1), (k = ((j + k) - 10)))
          else (j = (0 k)) = ((j + k) - 10) in
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
(19,10)-(22,43)
let (x1 , x2) = x in
let (a1 , a2) = a in
if (x1 + x2) > 10
then (1 , (((x1 + x2) + a1) - 10) :: a2)
else (0 , ((x1 + x2) + a1) :: a2)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(20,10)-(22,43)
a
VarG

(20,10)-(22,43)
let (a1 , a2) = a in
if (x1 + x2) > 10
then (1 , (((x1 + x2) + a1) - 10) :: a2)
else (0 , ((x1 + x2) + a1) :: a2)
LetG NonRec (fromList [VarG]) (IteG EmptyG EmptyG EmptyG)

(20,18)-(20,19)
x1
VarG

(20,23)-(20,25)
x2
VarG

(21,26)-(21,27)
(((x1 + x2) + a1) - 10) :: a2
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (BopG VarG VarG) VarG) LitG]))) Nothing

(21,36)-(21,37)
x1 + x2
BopG VarG VarG

(21,41)-(21,43)
x1
VarG

(21,41)-(21,43)
x2
VarG

(21,41)-(21,43)
a1
VarG

(22,20)-(22,25)
a2
VarG

(22,21)-(22,22)
(0 , ((x1 + x2) + a1) :: a2)
TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG,BopG (BopG VarG VarG) VarG]))) Nothing])

(22,29)-(22,43)
((x1 + x2) + a1) :: a2
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG VarG VarG) VarG]))) Nothing

(22,40)-(22,42)
x1 + x2
BopG VarG VarG

(23,4)-(25,51)
x1
VarG

(23,4)-(25,51)
x2
VarG

(23,4)-(25,51)
a1
VarG

(23,4)-(25,51)
a2
VarG

(23,19)-(23,20)
[]
ListG EmptyG Nothing

(24,38)-(24,40)
List.combine
VarG

(24,38)-(24,40)
List.combine l1 l2
AppG (fromList [VarG])

*)
