
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  let sizDif = length1 - length2 in
  if sizDif > 0
  then l1 :: (clone 0 sizDif) :: l2
  else (((clone 0) - sizDif) :: l1) :: l2;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

*)

(* changed spans
(5,2)-(10,41)
let sizDif =
  List.length l1 - List.length l2 in
if sizDif > 0
then (let pad =
        clone 0 sizDif in
      (l1 , pad @ l2))
else (let pad =
        clone 0 (- sizDif) in
      (pad @ l1 , l2))
LetG NonRec (fromList [BopG EmptyG EmptyG]) (IteG EmptyG EmptyG EmptyG)

(5,16)-(5,30)
List.length l1 - List.length l2
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(9,13)-(9,35)
let pad = clone 0 sizDif in
(l1 , pad @ l2)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(9,33)-(9,35)
l1
VarG

(9,33)-(9,35)
pad
VarG

(9,33)-(9,35)
(@)
VarG

(9,33)-(9,35)
pad @ l2
AppG (fromList [VarG])

(9,33)-(9,35)
(l1 , pad @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(10,9)-(10,18)
let pad =
  clone 0 (- sizDif) in
(pad @ l1 , l2)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(10,10)-(10,15)
clone 0 (- sizDif)
AppG (fromList [UopG EmptyG,LitG])

(10,21)-(10,27)
(- sizDif)
UopG VarG

(10,32)-(10,34)
pad
VarG

(10,32)-(10,34)
(@)
VarG

(10,32)-(10,34)
pad @ l1
AppG (fromList [VarG])

(10,32)-(10,34)
(pad @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)
