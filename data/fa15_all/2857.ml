
let rec clone x n =
  if n <= 0 then [] else (let y = clone x (n - 1) in x :: y);;

let rec helper curList lt1 lt2 =
  match lt1 with
  | [] -> curList
  | h::t -> helper ((h, (List.hd lt2)) :: curList) t (List.tl lt2);;

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
    let f a x = let (m,n) = a in let (o,p) = x in ((m + o), (n + p)) in
    let base = (0, 0) in
    let args = helper [] l1 l2 in
    let (_,res) = List.fold_left f base args in res in
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
(22,50)-(22,68)
let z = (o + p) + m in
if z > 9
then (1 , (z - 10) :: n)
else (0 , z :: n)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (IteG EmptyG EmptyG EmptyG)

(22,61)-(22,62)
o
VarG

(23,4)-(25,51)
m
VarG

(23,15)-(23,21)
z
VarG

(23,15)-(23,21)
z > 9
BopG VarG LitG

(23,15)-(23,21)
9
LitG

(23,15)-(23,21)
if z > 9
then (1 , (z - 10) :: n)
else (0 , z :: n)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(23,16)-(23,17)
z
VarG

(23,16)-(23,17)
n
VarG

(23,16)-(23,17)
z - 10
BopG VarG LitG

(23,16)-(23,17)
1
LitG

(23,16)-(23,17)
10
LitG

(23,16)-(23,17)
(0 , z :: n)
TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG]))) Nothing])

(23,16)-(23,17)
(z - 10) :: n
ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG]))) Nothing

(23,19)-(23,20)
z
VarG

(23,19)-(23,20)
n
VarG

(23,19)-(23,20)
let base = (0 , []) in
let args =
  (let rec helper =
     fun curList ->
       fun lt1 ->
         fun lt2 ->
           match lt1 with
           | [] -> curList
           | h :: t -> helper ((h , List.hd lt2) :: curList)
                              t (List.tl lt2) in
   helper [] l1 l2) in
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [TupleG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(23,19)-(23,20)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(23,19)-(23,20)
z :: n
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(24,4)-(25,51)
[]
ListG EmptyG Nothing

(24,15)-(24,30)
lt1
VarG

(24,15)-(24,30)
curList
VarG

(24,15)-(24,30)
fun curList ->
  fun lt1 ->
    fun lt2 ->
      match lt1 with
      | [] -> curList
      | h :: t -> helper ((h , List.hd lt2) :: curList)
                         t (List.tl lt2)
LamG (LamG EmptyG)

(24,15)-(24,30)
fun lt1 ->
  fun lt2 ->
    match lt1 with
    | [] -> curList
    | h :: t -> helper ((h , List.hd lt2) :: curList)
                       t (List.tl lt2)
LamG (LamG EmptyG)

(24,15)-(24,30)
fun lt2 ->
  match lt1 with
  | [] -> curList
  | h :: t -> helper ((h , List.hd lt2) :: curList)
                     t (List.tl lt2)
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(24,15)-(24,30)
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

(24,15)-(24,30)
match lt1 with
| [] -> curList
| h :: t -> helper ((h , List.hd lt2) :: curList)
                   t (List.tl lt2)
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG]))])

(24,22)-(24,24)
h
VarG

(24,22)-(24,24)
List.hd
VarG

(24,22)-(24,24)
lt2
VarG

(24,22)-(24,24)
curList
VarG

(24,22)-(24,24)
t
VarG

(24,22)-(24,24)
List.tl
VarG

(24,22)-(24,24)
lt2
VarG

(24,22)-(24,24)
helper
VarG

(24,22)-(24,24)
List.hd lt2
AppG (fromList [VarG])

(24,22)-(24,24)
List.tl lt2
AppG (fromList [VarG])

(24,22)-(24,24)
helper [] l1 l2
AppG (fromList [VarG,ListG EmptyG Nothing])

(24,22)-(24,24)
(h , List.hd lt2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(24,22)-(24,24)
(h , List.hd lt2) :: curList
ConAppG (Just (TupleG (fromList [VarG,TupleG (fromList [VarG,AppG (fromList [VarG])])]))) Nothing

*)
