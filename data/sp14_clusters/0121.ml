
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = ((x / 10), 1) in
    let base = (0, 0) in
    let args = (l1, l2) in let (_,res) = List.fold_left f base args in res in
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
(13,16)-(13,29)
a
VarG

(13,16)-(13,29)
x
VarG

(13,16)-(13,29)
l1'
VarG

(13,16)-(13,29)
l2'
VarG

(13,16)-(13,29)
carry
VarG

(13,16)-(13,29)
l1' + l2'
BopG VarG VarG

(13,16)-(13,29)
(l1' + l2') + carry
BopG (BopG EmptyG EmptyG) VarG

(13,16)-(13,29)
let (carry , num) = a in
let (l1' , l2') = x in
let addit =
  (l1' + l2') + carry in
(if addit > 10
 then addit mod 10
 else 0 , (addit / 10) :: num)
LetG NonRec [VarG] (LetG NonRec [EmptyG] EmptyG)

(13,16)-(13,29)
let (l1' , l2') = x in
let addit =
  (l1' + l2') + carry in
(if addit > 10
 then addit mod 10
 else 0 , (addit / 10) :: num)
LetG NonRec [VarG] (LetG NonRec [EmptyG] EmptyG)

(13,16)-(13,29)
let addit =
  (l1' + l2') + carry in
(if addit > 10
 then addit mod 10
 else 0 , (addit / 10) :: num)
LetG NonRec [BopG EmptyG EmptyG] (TupleG [EmptyG,EmptyG])

(13,17)-(13,25)
addit
VarG

(13,17)-(13,25)
addit
VarG

(13,17)-(13,25)
addit > 10
BopG VarG LitG

(13,17)-(13,25)
addit mod 10
BopG VarG LitG

(13,17)-(13,25)
10
LitG

(13,17)-(13,25)
10
LitG

(13,17)-(13,25)
0
LitG

(13,17)-(13,25)
if addit > 10
then addit mod 10
else 0
IteG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG) LitG

(13,17)-(13,25)
(addit / 10) :: num
ConAppG (Just (TupleG [BopG VarG LitG,VarG])) Nothing

(13,18)-(13,19)
addit
VarG

(13,27)-(13,28)
num
VarG

(14,19)-(14,20)
[]
ListG EmptyG Nothing

(15,15)-(15,23)
List.combine l1 l2
AppG [VarG,VarG]

(15,16)-(15,18)
List.combine
VarG

*)
