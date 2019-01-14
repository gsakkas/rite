
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
    let f a x = (x [0]) + (x [1]) in
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
(19,19)-(19,22)
a
VarG

(19,19)-(19,22)
let (r , s) = x in
let m = (r + s) + y in
(m / 10 , (m mod 10) :: z)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(19,26)-(19,33)
let (y , z) = a in
let (r , s) = x in
let m = (r + s) + y in
(m / 10 , (m mod 10) :: z)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(19,27)-(19,28)
r
VarG

(19,27)-(19,28)
s
VarG

(19,27)-(19,28)
y
VarG

(19,27)-(19,28)
m
VarG

(19,27)-(19,28)
m
VarG

(19,27)-(19,28)
z
VarG

(19,27)-(19,28)
r + s
BopG VarG VarG

(19,27)-(19,28)
(r + s) + y
BopG (BopG EmptyG EmptyG) VarG

(19,27)-(19,28)
m / 10
BopG VarG LitG

(19,27)-(19,28)
m mod 10
BopG VarG LitG

(19,27)-(19,28)
10
LitG

(19,27)-(19,28)
10
LitG

(19,27)-(19,28)
(m / 10 , (m mod 10) :: z)
TupleG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG) Nothing])

(19,27)-(19,28)
(m mod 10) :: z
ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG]))) Nothing

(19,29)-(19,32)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(19,30)-(19,31)
let m = (r + s) + y in
(m / 10 , (m mod 10) :: z)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (TupleG (fromList [EmptyG]))

(19,30)-(19,31)
[]
ListG EmptyG Nothing

*)
