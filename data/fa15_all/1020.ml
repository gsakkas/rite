
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
    let f a x = let (r,s) = x in r + s in
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
(19,4)-(22,51)
a
VarG

(19,4)-(22,51)
let (y , z) = a in
let (r , s) = x in
let m = (r + s) + y in
(m / 10 , (m mod 10) :: z)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(19,12)-(19,38)
let m = (r + s) + y in
(m / 10 , (m mod 10) :: z)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (TupleG (fromList [EmptyG]))

(19,16)-(19,38)
r + s
BopG VarG VarG

(19,33)-(19,34)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(19,33)-(19,38)
y
VarG

(19,33)-(19,38)
m
VarG

(19,33)-(19,38)
m
VarG

(19,33)-(19,38)
z
VarG

(19,33)-(19,38)
m / 10
BopG VarG LitG

(19,33)-(19,38)
m mod 10
BopG VarG LitG

(19,33)-(19,38)
10
LitG

(19,33)-(19,38)
10
LitG

(19,33)-(19,38)
(m / 10 , (m mod 10) :: z)
TupleG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG) Nothing])

(19,33)-(19,38)
(m mod 10) :: z
ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG]))) Nothing

(19,37)-(19,38)
[]
ListG EmptyG Nothing

*)
