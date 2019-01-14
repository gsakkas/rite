
let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (c,a1::a2) = a in
      let v = (x1 + x2) + c in ((v / 10), ([v / 10] @ ([v mod 10] @ a2))) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i < 1
  then []
  else (match i with | 1 -> l | _ -> bigAdd l (mulByDigit (i - 1) l));;

let bigMul l1 l2 =
  let f a x = (0, (bigAdd ((mulByDigit x l2) a))) in
  let base = (0, [0]) in
  let args = l1 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (c,a1::a2) = a in
      let v = (x1 + x2) + c in ((v / 10), ([v / 10] @ ([v mod 10] @ a2))) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i < 1
  then []
  else
    (match i with
     | 1 -> l
     | 10 -> l @ [0]
     | _ -> bigAdd l (mulByDigit (i - 1) l));;

let bigMul l1 l2 =
  let f a x =
    let (c,a') = a in
    let m = mulByDigit x l2 in let s = bigAdd m a' in ((c + 1), s) in
  let base = (0, [0]) in
  let args = l1 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(34,7)-(34,69)
match i with
| 1 -> l
| 10 -> l @ [0]
| _ -> bigAdd l
              (mulByDigit (i - 1) l)
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG]))])

(34,37)-(34,43)
l
VarG

(34,37)-(34,43)
(@)
VarG

(34,37)-(34,43)
bigAdd l (mulByDigit (i - 1)
                     l)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(34,37)-(34,43)
0
LitG

(34,37)-(34,43)
[0]
ListG LitG Nothing

(37,26)-(37,47)
let (c , a') = a in
let m = mulByDigit x l2 in
let s = bigAdd m a' in
(c + 1 , s)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(37,27)-(37,44)
a
VarG

(37,27)-(37,44)
let m = mulByDigit x l2 in
let s = bigAdd m a' in
(c + 1 , s)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(37,45)-(37,46)
let s = bigAdd m a' in
(c + 1 , s)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(38,2)-(39,66)
bigAdd
VarG

(38,2)-(39,66)
m
VarG

(38,2)-(39,66)
a'
VarG

(38,2)-(39,66)
c
VarG

(38,2)-(39,66)
s
VarG

(38,2)-(39,66)
bigAdd m a'
AppG (fromList [VarG])

(38,2)-(39,66)
c + 1
BopG VarG LitG

(38,2)-(39,66)
1
LitG

(38,2)-(39,66)
(c + 1 , s)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

*)
