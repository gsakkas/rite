
let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n < 0 then (((clone 0 (- n)) @ l1), l2) else (l1, ((clone 0 n) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (x1,x2) = x in (0, (x1 + x2)) :: a in
    let base = [] in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n < 0 then (((clone 0 (- n)) @ l1), l2) else (l1, ((clone 0 n) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      ((if ((a1 + x1) + x2) >= 10 then 1 else 0), (((a1 + x1) + x2) :: a2)) in
    let base = (0, [0]) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(14,35)-(14,49)
a
VarG

(14,35)-(14,54)
let (a1 , a2) = a in
(if ((a1 + x1) + x2) >= 10
 then 1
 else 0 , ((a1 + x1) + x2) :: a2)
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(14,36)-(14,37)
a1
VarG

(14,36)-(14,37)
x1
VarG

(14,36)-(14,37)
x2
VarG

(14,36)-(14,37)
(a1 + x1) + x2
BopG (BopG EmptyG EmptyG) VarG

(14,36)-(14,37)
((a1 + x1) + x2) >= 10
BopG (BopG EmptyG EmptyG) LitG

(14,36)-(14,37)
a1 + x1
BopG VarG VarG

(14,36)-(14,37)
10
LitG

(14,36)-(14,37)
1
LitG

(14,36)-(14,37)
if ((a1 + x1) + x2) >= 10
then 1
else 0
IteG (BopG EmptyG EmptyG) LitG LitG

(14,39)-(14,48)
((a1 + x1) + x2) :: a2
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG VarG VarG) VarG]))) Nothing

(14,40)-(14,42)
a1
VarG

(14,40)-(14,42)
a1 + x1
BopG VarG VarG

(14,53)-(14,54)
a2
VarG

(15,15)-(15,17)
(0 , [0])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(16,4)-(17,51)
0
LitG

(16,4)-(17,51)
0
LitG

(16,4)-(17,51)
[0]
ListG LitG Nothing

*)
