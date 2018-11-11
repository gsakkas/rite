
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
    let f a x = match x with | (m,n) -> (m + n) :: a in
    let base = [] in
    let args = match List.rev ((List.combine l1), l2) with | h::t -> h in
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
(18,40)-(18,47)
n1
VarG

(18,40)-(18,47)
prevN
VarG

(18,40)-(18,47)
a
VarG

(18,40)-(18,47)
p2
VarG

(18,40)-(18,47)
sumlist
VarG

(18,40)-(18,47)
a
VarG

(18,40)-(18,47)
fun (n1 , n2) -> n1
LamG VarG

(18,40)-(18,47)
fun (p1 , p2) -> p2
LamG VarG

(18,40)-(18,47)
fun (m , n) -> m + n
LamG (BopG EmptyG EmptyG)

(18,40)-(18,47)
prevN a
AppG [VarG]

(18,40)-(18,47)
sumlist a
AppG [VarG]

(18,40)-(18,47)
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

(18,40)-(18,47)
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

(18,40)-(18,47)
let sum = sumlist a in
let add =
  fun (m , n) -> m + n in
let digit = add x + prev in
if digit > 10
then (1 , (digit - 10) :: sum)
else (0 , digit :: sum)
LetG NonRec [AppG [EmptyG]] (LetG NonRec [EmptyG] EmptyG)

(18,40)-(18,47)
let add =
  fun (m , n) -> m + n in
let digit = add x + prev in
if digit > 10
then (1 , (digit - 10) :: sum)
else (0 , digit :: sum)
LetG NonRec [LamG EmptyG] (LetG NonRec [EmptyG] EmptyG)

(18,40)-(18,52)
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

(18,51)-(18,52)
let digit = add x + prev in
if digit > 10
then (1 , (digit - 10) :: sum)
else (0 , digit :: sum)
LetG NonRec [BopG EmptyG EmptyG] (IteG EmptyG EmptyG EmptyG)

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
add x
AppG [VarG]

(19,4)-(21,51)
add x + prev
BopG (AppG [EmptyG]) VarG

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
if digit > 10
then (1 , (digit - 10) :: sum)
else (0 , digit :: sum)
IteG (BopG EmptyG EmptyG) (TupleG [EmptyG,EmptyG]) (TupleG [EmptyG,EmptyG])

(19,4)-(21,51)
(1 , (digit - 10) :: sum)
TupleG [LitG,ConAppG (Just (TupleG [BopG VarG LitG,VarG])) Nothing]

(19,4)-(21,51)
(0 , digit :: sum)
TupleG [LitG,ConAppG (Just (TupleG [VarG,VarG])) Nothing]

(19,4)-(21,51)
(digit - 10) :: sum
ConAppG (Just (TupleG [BopG VarG LitG,VarG])) Nothing

(19,4)-(21,51)
digit :: sum
ConAppG (Just (TupleG [VarG,VarG])) Nothing

(19,15)-(19,17)
0
LitG

(19,15)-(19,17)
(0 , [])
TupleG [LitG,ListG EmptyG Nothing]

(20,31)-(20,48)
List.combine l1 l2
AppG [VarG,VarG]

*)
