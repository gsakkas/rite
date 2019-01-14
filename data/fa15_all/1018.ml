
let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then let z = x - y in (l1, ((clone 0 z) @ l2))
  else (let z = y - x in (((clone 0 z) @ l1), l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a + x in
    let base = 0 in
    let args = l1 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then let z = x - y in (l1, ((clone 0 z) @ l2))
  else (let z = y - x in (((clone 0 z) @ l1), l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (y,z) = a in
      let (r,s) = x in let m = (r + s) + y in ((m / 10), ((m mod 10) :: z)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,12)-(19,21)
let (r , s) = x in
let m = (r + s) + y in
(m / 10 , (m mod 10) :: z)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(19,16)-(19,17)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(19,16)-(19,21)
r
VarG

(19,16)-(19,21)
s
VarG

(19,16)-(19,21)
y
VarG

(19,16)-(19,21)
m
VarG

(19,16)-(19,21)
m
VarG

(19,16)-(19,21)
z
VarG

(19,16)-(19,21)
r + s
BopG VarG VarG

(19,16)-(19,21)
(r + s) + y
BopG (BopG EmptyG EmptyG) VarG

(19,16)-(19,21)
m / 10
BopG VarG LitG

(19,16)-(19,21)
m mod 10
BopG VarG LitG

(19,16)-(19,21)
10
LitG

(19,16)-(19,21)
10
LitG

(19,16)-(19,21)
let (y , z) = a in
let (r , s) = x in
let m = (r + s) + y in
(m / 10 , (m mod 10) :: z)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(19,16)-(19,21)
let m = (r + s) + y in
(m / 10 , (m mod 10) :: z)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (TupleG (fromList [EmptyG]))

(19,16)-(19,21)
(m / 10 , (m mod 10) :: z)
TupleG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG) Nothing])

(19,16)-(19,21)
(m mod 10) :: z
ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG]))) Nothing

(19,20)-(19,21)
[]
ListG EmptyG Nothing

(20,4)-(21,68)
List.combine
VarG

(20,4)-(21,68)
List.combine l1 l2
AppG (fromList [VarG])

(20,15)-(20,16)
l2
VarG

*)
