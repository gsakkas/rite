
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let shorter = if len1 < len2 then l1 else l2 in
  let zeros = if shorter = l1 then len2 - len1 else len1 - len2 in
  if shorter = l1
  then ((List.append (clone 0 zeros) shorter), l2)
  else (l1, (List.append (clone 0 zeros) shorter));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = [] in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let shorter = if len1 < len2 then l1 else l2 in
  let zeros = if shorter = l1 then len2 - len1 else len1 - len2 in
  if shorter = l1
  then ((List.append (clone 0 zeros) shorter), l2)
  else (l1, (List.append (clone 0 zeros) shorter));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let prevN (n1,n2) = n1 in
      let prev = prevN a in
      let sumlist (p1,p2) = p2 in
      let sum = sumlist a in
      let add (m,n) = m + n in
      let digit = (add x) + prev in
      if digit > 10 then (1, ((digit - 10) :: sum)) else (0, (digit :: sum)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,16)-(18,18)
let prevN =
  fun (n1 , n2) -> n1 in
let prev = prevN a in
let sumlist =
  fun (p1 , p2) -> p2 in
let sum = sumlist a in
let add =
  fun (m , n) -> m + n in
let digit = add x + prev in
if digit > 10
then (1 , (digit - 10) :: sum)
else (0 , digit :: sum)
LetG NonRec (fromList [LamG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(19,4)-(21,51)
n1
VarG

(19,4)-(21,51)
prevN
VarG

(19,4)-(21,51)
a
VarG

(19,4)-(21,51)
p2
VarG

(19,4)-(21,51)
sumlist
VarG

(19,4)-(21,51)
a
VarG

(19,4)-(21,51)
m
VarG

(19,4)-(21,51)
n
VarG

(19,4)-(21,51)
add
VarG

(19,4)-(21,51)
x
VarG

(19,4)-(21,51)
prev
VarG

(19,4)-(21,51)
digit
VarG

(19,4)-(21,51)
digit
VarG

(19,4)-(21,51)
sum
VarG

(19,4)-(21,51)
digit
VarG

(19,4)-(21,51)
sum
VarG

(19,4)-(21,51)
fun (n1 , n2) -> n1
LamG VarG

(19,4)-(21,51)
fun (p1 , p2) -> p2
LamG VarG

(19,4)-(21,51)
fun (m , n) -> m + n
LamG (BopG EmptyG EmptyG)

(19,4)-(21,51)
prevN a
AppG (fromList [VarG])

(19,4)-(21,51)
sumlist a
AppG (fromList [VarG])

(19,4)-(21,51)
add x
AppG (fromList [VarG])

(19,4)-(21,51)
m + n
BopG VarG VarG

(19,4)-(21,51)
add x + prev
BopG (AppG (fromList [EmptyG])) VarG

(19,4)-(21,51)
digit > 10
BopG VarG LitG

(19,4)-(21,51)
digit - 10
BopG VarG LitG

(19,4)-(21,51)
10
LitG

(19,4)-(21,51)
1
LitG

(19,4)-(21,51)
10
LitG

(19,4)-(21,51)
0
LitG

(19,4)-(21,51)
let prev = prevN a in
let sumlist =
  fun (p1 , p2) -> p2 in
let sum = sumlist a in
let add =
  fun (m , n) -> m + n in
let digit = add x + prev in
if digit > 10
then (1 , (digit - 10) :: sum)
else (0 , digit :: sum)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(19,4)-(21,51)
let sumlist =
  fun (p1 , p2) -> p2 in
let sum = sumlist a in
let add =
  fun (m , n) -> m + n in
let digit = add x + prev in
if digit > 10
then (1 , (digit - 10) :: sum)
else (0 , digit :: sum)
LetG NonRec (fromList [LamG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(19,4)-(21,51)
let sum = sumlist a in
let add =
  fun (m , n) -> m + n in
let digit = add x + prev in
if digit > 10
then (1 , (digit - 10) :: sum)
else (0 , digit :: sum)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(19,4)-(21,51)
let add =
  fun (m , n) -> m + n in
let digit = add x + prev in
if digit > 10
then (1 , (digit - 10) :: sum)
else (0 , digit :: sum)
LetG NonRec (fromList [LamG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(19,4)-(21,51)
let digit = add x + prev in
if digit > 10
then (1 , (digit - 10) :: sum)
else (0 , digit :: sum)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (IteG EmptyG EmptyG EmptyG)

(19,4)-(21,51)
if digit > 10
then (1 , (digit - 10) :: sum)
else (0 , digit :: sum)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(19,4)-(21,51)
(1 , (digit - 10) :: sum)
TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG]))) Nothing])

(19,4)-(21,51)
(0 , digit :: sum)
TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG]))) Nothing])

(19,4)-(21,51)
(digit - 10) :: sum
ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG]))) Nothing

(19,4)-(21,51)
digit :: sum
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(19,15)-(19,17)
0
LitG

(19,15)-(19,17)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

*)
