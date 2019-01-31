
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (y,z) = x in (y + z) @ a in
    let base = [] in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      if let (carry,ans) = a in let (y,z) = x in ((y + z) + carry) > 9
      then
        let (carry,ans) = a in
        (1, (let (y,z) = x in [((y + z) + carry) mod 10] @ ans))
      else
        (let (carry,ans) = a in
         (0, (let (y,z) = x in [(y + z) + carry] @ ans))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(14,16)-(14,44)
a
VarG

(14,16)-(14,44)
let (carry , ans) = a in
let (y , z) = x in
((y + z) + carry) > 9
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(14,16)-(14,44)
if (let (carry , ans) = a in
    let (y , z) = x in
    ((y + z) + carry) > 9)
then (let (carry , ans) = a in
      (1 , let (y , z) = x in
           [((y + z) + carry) mod 10] @ ans))
else (let (carry , ans) = a in
      (0 , let (y , z) = x in
           [(y + z) + carry] @ ans))
IteG (LetG NonRec (fromList [EmptyG]) EmptyG) (LetG NonRec (fromList [EmptyG]) EmptyG) (LetG NonRec (fromList [EmptyG]) EmptyG)

(14,33)-(14,40)
((y + z) + carry) mod 10
BopG (BopG EmptyG EmptyG) LitG

(14,33)-(14,40)
[((y + z) + carry) mod 10]
ListG (BopG EmptyG EmptyG) Nothing

(14,33)-(14,44)
y
VarG

(14,33)-(14,44)
z
VarG

(14,33)-(14,44)
carry
VarG

(14,33)-(14,44)
a
VarG

(14,33)-(14,44)
x
VarG

(14,33)-(14,44)
(y + z) + carry
BopG (BopG EmptyG EmptyG) VarG

(14,33)-(14,44)
((y + z) + carry) > 9
BopG (BopG EmptyG EmptyG) LitG

(14,33)-(14,44)
y + z
BopG VarG VarG

(14,33)-(14,44)
9
LitG

(14,33)-(14,44)
1
LitG

(14,33)-(14,44)
let (carry , ans) = a in
(1 , let (y , z) = x in
     [((y + z) + carry) mod 10] @ ans)
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(14,33)-(14,44)
let (y , z) = x in
[((y + z) + carry) mod 10] @ ans
LetG NonRec (fromList [VarG]) (AppG (fromList [EmptyG]))

(14,33)-(14,44)
(1 , let (y , z) = x in
     [((y + z) + carry) mod 10] @ ans)
TupleG (fromList [LitG,LetG NonRec (fromList [EmptyG]) EmptyG])

(14,34)-(14,35)
y + z
BopG VarG VarG

(14,43)-(14,44)
carry
VarG

(14,43)-(14,44)
ans
VarG

(14,43)-(14,44)
10
LitG

(14,43)-(14,44)
let (carry , ans) = a in
(0 , let (y , z) = x in
     [(y + z) + carry] @ ans)
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(15,4)-(17,51)
x
VarG

(15,4)-(17,51)
y
VarG

(15,4)-(17,51)
z
VarG

(15,4)-(17,51)
carry
VarG

(15,4)-(17,51)
(@)
VarG

(15,4)-(17,51)
ans
VarG

(15,4)-(17,51)
[(y + z) + carry] @ ans
AppG (fromList [VarG,ListG EmptyG Nothing])

(15,4)-(17,51)
y + z
BopG VarG VarG

(15,4)-(17,51)
(y + z) + carry
BopG (BopG EmptyG EmptyG) VarG

(15,4)-(17,51)
0
LitG

(15,4)-(17,51)
let (y , z) = x in
[(y + z) + carry] @ ans
LetG NonRec (fromList [VarG]) (AppG (fromList [EmptyG]))

(15,4)-(17,51)
(0 , let (y , z) = x in
     [(y + z) + carry] @ ans)
TupleG (fromList [LitG,LetG NonRec (fromList [EmptyG]) EmptyG])

(15,4)-(17,51)
[(y + z) + carry]
ListG (BopG EmptyG EmptyG) Nothing

(15,15)-(15,17)
0
LitG

(15,15)-(15,17)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

*)
