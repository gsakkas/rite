
let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then let z = x - y in (l1, ((clone 0 z) @ l2))
  else (let z = y - x in (((clone 0 z) @ l1), l2));;

let pairHelper x = let (r,s) = x in r + s;;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = pairHelper x in
    let base = 0 in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
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
(21,12)-(21,28)
a
VarG

(21,12)-(21,28)
let (r , s) = x in
let m = (r + s) + y in
(m / 10 , (m mod 10) :: z)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(21,16)-(21,26)
let (y , z) = a in
let (r , s) = x in
let m = (r + s) + y in
(m / 10 , (m mod 10) :: z)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(21,16)-(21,26)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(21,16)-(21,28)
r
VarG

(21,16)-(21,28)
s
VarG

(21,16)-(21,28)
y
VarG

(21,16)-(21,28)
m
VarG

(21,16)-(21,28)
m
VarG

(21,16)-(21,28)
z
VarG

(21,16)-(21,28)
r + s
BopG VarG VarG

(21,16)-(21,28)
(r + s) + y
BopG (BopG EmptyG EmptyG) VarG

(21,16)-(21,28)
m / 10
BopG VarG LitG

(21,16)-(21,28)
m mod 10
BopG VarG LitG

(21,16)-(21,28)
10
LitG

(21,16)-(21,28)
10
LitG

(21,16)-(21,28)
let m = (r + s) + y in
(m / 10 , (m mod 10) :: z)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (TupleG (fromList [EmptyG]))

(21,16)-(21,28)
(m / 10 , (m mod 10) :: z)
TupleG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG) Nothing])

(21,16)-(21,28)
(m mod 10) :: z
ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG]))) Nothing

(21,27)-(21,28)
[]
ListG EmptyG Nothing

*)
