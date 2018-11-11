
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
      match x with
      | (a,b) ->
          if (a + b) > 9 then 1 :: ((a + b) - 10) :: a else (a + b) :: a in
    let base = [] in
    let args = match List.rev (List.combine l1 l2) with | h::t -> h in
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
(19,6)-(21,72)
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
LetG NonRec [LamG EmptyG] (LetG NonRec [EmptyG] EmptyG)

(19,12)-(19,13)
n1
VarG

(19,12)-(19,13)
prevN
VarG

(19,12)-(19,13)
a
VarG

(19,12)-(19,13)
p2
VarG

(19,12)-(19,13)
sumlist
VarG

(19,12)-(19,13)
a
VarG

(19,12)-(19,13)
m
VarG

(19,12)-(19,13)
n
VarG

(19,12)-(19,13)
add
VarG

(19,12)-(19,13)
fun (n1 , n2) -> n1
LamG VarG

(19,12)-(19,13)
fun (p1 , p2) -> p2
LamG VarG

(19,12)-(19,13)
fun (m , n) -> m + n
LamG (BopG EmptyG EmptyG)

(19,12)-(19,13)
prevN a
AppG [VarG]

(19,12)-(19,13)
sumlist a
AppG [VarG]

(19,12)-(19,13)
add x
AppG [VarG]

(19,12)-(19,13)
m + n
BopG VarG VarG

(19,12)-(19,13)
add x + prev
BopG (AppG [EmptyG]) VarG

(19,12)-(19,13)
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
LetG NonRec [AppG [EmptyG]] (LetG NonRec [EmptyG] EmptyG)

(19,12)-(19,13)
let sumlist =
  fun (p1 , p2) -> p2 in
let sum = sumlist a in
let add =
  fun (m , n) -> m + n in
let digit = add x + prev in
if digit > 10
then (1 , (digit - 10) :: sum)
else (0 , digit :: sum)
LetG NonRec [LamG EmptyG] (LetG NonRec [EmptyG] EmptyG)

(19,12)-(19,13)
let sum = sumlist a in
let add =
  fun (m , n) -> m + n in
let digit = add x + prev in
if digit > 10
then (1 , (digit - 10) :: sum)
else (0 , digit :: sum)
LetG NonRec [AppG [EmptyG]] (LetG NonRec [EmptyG] EmptyG)

(19,12)-(19,13)
let add =
  fun (m , n) -> m + n in
let digit = add x + prev in
if digit > 10
then (1 , (digit - 10) :: sum)
else (0 , digit :: sum)
LetG NonRec [LamG EmptyG] (LetG NonRec [EmptyG] EmptyG)

(19,12)-(19,13)
let digit = add x + prev in
if digit > 10
then (1 , (digit - 10) :: sum)
else (0 , digit :: sum)
LetG NonRec [BopG EmptyG EmptyG] (IteG EmptyG EmptyG EmptyG)

(21,10)-(21,72)
prev
VarG

(21,30)-(21,31)
10
LitG

(21,30)-(21,31)
(1 , (digit - 10) :: sum)
TupleG [LitG,ConAppG (Just (TupleG [BopG VarG LitG,VarG])) Nothing]

(21,30)-(21,54)
digit
VarG

(21,41)-(21,42)
digit
VarG

(21,53)-(21,54)
sum
VarG

(21,60)-(21,72)
0
LitG

(21,60)-(21,72)
(0 , digit :: sum)
TupleG [LitG,ConAppG (Just (TupleG [VarG,VarG])) Nothing]

(21,71)-(21,72)
digit
VarG

(22,4)-(24,51)
sum
VarG

(22,15)-(22,17)
0
LitG

(22,15)-(22,17)
(0 , [])
TupleG [LitG,ListG EmptyG Nothing]

*)
