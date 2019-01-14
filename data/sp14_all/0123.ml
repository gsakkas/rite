
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "" in
    let base = (0, 0) in
    let args = [(l1, l2)] in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,num) = a in
      let (l1',l2') = x in
      let addit = (l1' + l2') + carry in
      ((if addit > 10 then addit mod 10 else 0), ((addit / 10) :: num)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(14,4)-(15,76)
let (carry , num) = a in
let (l1' , l2') = x in
let addit =
  (l1' + l2') + carry in
(if addit > 10
 then addit mod 10
 else 0 , (addit / 10) :: num)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(14,15)-(14,21)
a
VarG

(14,15)-(14,21)
x
VarG

(14,15)-(14,21)
l1'
VarG

(14,15)-(14,21)
l2'
VarG

(14,15)-(14,21)
carry
VarG

(14,15)-(14,21)
l1' + l2'
BopG VarG VarG

(14,15)-(14,21)
(l1' + l2') + carry
BopG (BopG EmptyG EmptyG) VarG

(14,15)-(14,21)
let (l1' , l2') = x in
let addit =
  (l1' + l2') + carry in
(if addit > 10
 then addit mod 10
 else 0 , (addit / 10) :: num)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(14,15)-(14,21)
let addit =
  (l1' + l2') + carry in
(if addit > 10
 then addit mod 10
 else 0 , (addit / 10) :: num)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (TupleG (fromList [EmptyG]))

(14,16)-(14,17)
addit
VarG

(14,16)-(14,17)
addit
VarG

(14,16)-(14,17)
addit > 10
BopG VarG LitG

(14,16)-(14,17)
addit mod 10
BopG VarG LitG

(14,16)-(14,17)
10
LitG

(14,16)-(14,17)
10
LitG

(14,16)-(14,17)
if addit > 10
then addit mod 10
else 0
IteG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG) LitG

(14,19)-(14,20)
addit
VarG

(14,19)-(14,20)
num
VarG

(14,19)-(14,20)
addit / 10
BopG VarG LitG

(14,19)-(14,20)
10
LitG

(14,19)-(14,20)
let base = (0 , []) in
let args =
  List.combine l1 l2 in
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [TupleG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(14,19)-(14,20)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(14,19)-(14,20)
(addit / 10) :: num
ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG]))) Nothing

(15,4)-(15,76)
[]
ListG EmptyG Nothing

(15,16)-(15,24)
List.combine l1 l2
AppG (fromList [VarG])

(15,17)-(15,19)
List.combine
VarG

*)
