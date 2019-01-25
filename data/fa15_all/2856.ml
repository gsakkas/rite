
let rec clone x n =
  if n <= 0 then [] else (let y = clone x (n - 1) in x :: y);;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x < y
  then (((clone 0 (y - x)) @ l1), l2)
  else (l1, ((clone 0 (x - y)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | x::y -> if x = 0 then removeZero y else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a + x in
    let base = 0 in
    let args = (l1, l2) in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  if n <= 0 then [] else (let y = clone x (n - 1) in x :: y);;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x < y
  then (((clone 0 (y - x)) @ l1), l2)
  else (l1, ((clone 0 (x - y)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | x::y -> if x = 0 then removeZero y else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (m,n) = a in
      let (o,p) = x in
      let z = (o + p) + m in
      if z > 9 then (1, ((z - 10) :: n)) else (0, (z :: n)) in
    let base = (0, []) in
    let args =
      let rec helper curList lt1 lt2 =
        match lt1 with
        | [] -> curList
        | h::t -> helper ((h, (List.hd lt2)) :: curList) t (List.tl lt2) in
      helper [] l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(17,16)-(17,21)
let (m , n) = a in
let (o , p) = x in
let z = (o + p) + m in
if z > 9
then (1 , (z - 10) :: n)
else (0 , z :: n)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(17,20)-(17,21)
let (o , p) = x in
let z = (o + p) + m in
if z > 9
then (1 , (z - 10) :: n)
else (0 , z :: n)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(18,4)-(19,74)
o
VarG

(18,4)-(19,74)
p
VarG

(18,4)-(19,74)
m
VarG

(18,4)-(19,74)
z
VarG

(18,4)-(19,74)
z
VarG

(18,4)-(19,74)
n
VarG

(18,4)-(19,74)
z
VarG

(18,4)-(19,74)
n
VarG

(18,4)-(19,74)
o + p
BopG VarG VarG

(18,4)-(19,74)
(o + p) + m
BopG (BopG EmptyG EmptyG) VarG

(18,4)-(19,74)
z > 9
BopG VarG LitG

(18,4)-(19,74)
z - 10
BopG VarG LitG

(18,4)-(19,74)
9
LitG

(18,4)-(19,74)
1
LitG

(18,4)-(19,74)
10
LitG

(18,4)-(19,74)
0
LitG

(18,4)-(19,74)
let z = (o + p) + m in
if z > 9
then (1 , (z - 10) :: n)
else (0 , z :: n)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (IteG EmptyG EmptyG EmptyG)

(18,4)-(19,74)
if z > 9
then (1 , (z - 10) :: n)
else (0 , z :: n)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(18,4)-(19,74)
(1 , (z - 10) :: n)
TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG]))) Nothing])

(18,4)-(19,74)
(0 , z :: n)
TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG]))) Nothing])

(18,4)-(19,74)
(z - 10) :: n
ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG]))) Nothing

(18,4)-(19,74)
z :: n
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(18,15)-(18,16)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(19,4)-(19,74)
[]
ListG EmptyG Nothing

(19,15)-(19,23)
lt1
VarG

(19,15)-(19,23)
curList
VarG

(19,15)-(19,23)
helper
VarG

(19,15)-(19,23)
fun curList ->
  fun lt1 ->
    fun lt2 ->
      match lt1 with
      | [] -> curList
      | h :: t -> helper ((h , List.hd lt2) :: curList)
                         t (List.tl lt2)
LamG (LamG EmptyG)

(19,15)-(19,23)
fun lt1 ->
  fun lt2 ->
    match lt1 with
    | [] -> curList
    | h :: t -> helper ((h , List.hd lt2) :: curList)
                       t (List.tl lt2)
LamG (LamG EmptyG)

(19,15)-(19,23)
fun lt2 ->
  match lt1 with
  | [] -> curList
  | h :: t -> helper ((h , List.hd lt2) :: curList)
                     t (List.tl lt2)
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(19,15)-(19,23)
helper ((h , List.hd lt2) :: curList)
       t (List.tl lt2)
AppG (fromList [VarG,AppG (fromList [EmptyG]),ConAppG (Just EmptyG) Nothing])

(19,15)-(19,23)
let rec helper =
  fun curList ->
    fun lt1 ->
      fun lt2 ->
        match lt1 with
        | [] -> curList
        | h :: t -> helper ((h , List.hd lt2) :: curList)
                           t (List.tl lt2) in
helper [] l1 l2
LetG Rec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(19,15)-(19,23)
match lt1 with
| [] -> curList
| h :: t -> helper ((h , List.hd lt2) :: curList)
                   t (List.tl lt2)
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG]))])

(19,15)-(19,23)
(h , List.hd lt2) :: curList
ConAppG (Just (TupleG (fromList [VarG,TupleG (fromList [VarG,AppG (fromList [VarG])])]))) Nothing

(19,16)-(19,18)
h
VarG

(19,16)-(19,18)
List.hd
VarG

(19,16)-(19,18)
lt2
VarG

(19,16)-(19,18)
curList
VarG

(19,16)-(19,18)
t
VarG

(19,16)-(19,18)
List.tl
VarG

(19,16)-(19,18)
lt2
VarG

(19,16)-(19,18)
helper
VarG

(19,16)-(19,18)
List.hd lt2
AppG (fromList [VarG])

(19,16)-(19,18)
List.tl lt2
AppG (fromList [VarG])

(19,16)-(19,18)
helper [] l1 l2
AppG (fromList [VarG,ListG EmptyG Nothing])

(19,16)-(19,18)
[]
ListG EmptyG Nothing

*)