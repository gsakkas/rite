
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let d = (List.length l1) - (List.length l2) in
  if d < 0 then (((clone 0 (0 - d)) @ l1), l2) else (l1, ((clone 0 d) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | [] -> []
      | h::t ->
          let (j,k) = x in
          if (j + k) > 9
          then 1 :: (((h + j) + k) - 10) :: t
          else 0 :: ((h + j) + k) :: t in
    let base = [0] in
    let args = List.rev l1 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let d = (List.length l1) - (List.length l2) in
  if d < 0 then (((clone 0 (0 - d)) @ l1), l2) else (l1, ((clone 0 d) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (j,k) = x in
      let (l,m) = a in
      if ((j + k) + l) > 9
      then (1, ((((j + k) + l) - 10) :: m))
      else (0, (((j + k) + l) :: m)) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,10)-(20,38)
a
VarG

(18,10)-(20,38)
let (l , m) = a in
if ((j + k) + l) > 9
then (1 , (((j + k) + l) - 10) :: m)
else (0 , ((j + k) + l) :: m)
LetG NonRec (fromList [VarG]) (IteG EmptyG EmptyG EmptyG)

(18,14)-(18,15)
j + k
BopG VarG VarG

(18,23)-(18,24)
l
VarG

(19,15)-(19,45)
(1 , (((j + k) + l) - 10) :: m)
TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (BopG VarG VarG) VarG) LitG]))) Nothing])

(19,37)-(19,39)
l
VarG

(20,15)-(20,16)
(0 , ((j + k) + l) :: m)
TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG,BopG (BopG VarG VarG) VarG]))) Nothing])

(20,15)-(20,38)
m
VarG

(20,37)-(20,38)
l
VarG

(21,4)-(22,77)
m
VarG

(21,15)-(21,18)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(22,4)-(22,77)
[]
ListG EmptyG Nothing

(22,15)-(22,26)
List.combine
VarG

(22,15)-(22,26)
List.combine (List.rev l1)
             (List.rev l2)
AppG (fromList [AppG (fromList [EmptyG])])

(22,30)-(22,77)
List.rev
VarG

(22,30)-(22,77)
l2
VarG

(22,30)-(22,77)
List.rev l2
AppG (fromList [VarG])

*)
