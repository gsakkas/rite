
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let numZeros = (List.length l1) - (List.length l2) in
  let absNumZeros = abs numZeros in
  if numZeros = 0
  then (l1, l2)
  else
    (let listZeros = clone 0 absNumZeros in
     if numZeros > 0 then (l1, (listZeros @ l2)) else ((listZeros @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | h::t -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (_,currentCarry::currentSum) = a in
      let (toSum1,toSum2) = x in
      let intermediateValue = (toSum1 + toSum2) + currentCarry in
      let valueToAddToArray = intermediateValue mod 10 in
      let carry = intermediateValue / 10 in
      (carry, (carry :: valueToAddToArray :: currentSum)) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i <= 0 then [] else bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    let (padCount,currList) = a in
    let intermediateSum = mulByDigit x l2 in
    let toSum = intermediateSum * (10 ** padCount) in
    ((padCount - 1), (bigAdd currList toSum)) in
  let base = (0, []) in
  let args = l1 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let numZeros = (List.length l1) - (List.length l2) in
  let absNumZeros = abs numZeros in
  if numZeros = 0
  then (l1, l2)
  else
    (let listZeros = clone 0 absNumZeros in
     if numZeros > 0 then (l1, (listZeros @ l2)) else ((listZeros @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | h::t -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (_,currentCarry::currentSum) = a in
      let (toSum1,toSum2) = x in
      let intermediateValue = (toSum1 + toSum2) + currentCarry in
      let valueToAddToArray = intermediateValue mod 10 in
      let carry = intermediateValue / 10 in
      (carry, (carry :: valueToAddToArray :: currentSum)) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i <= 0 then [] else bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    let (padCount,currList) = a in
    let intermediateSum = mulByDigit x l2 in
    let rec generatePadding numZeros =
      if numZeros <= 0 then [] else 0 :: (generatePadding (numZeros - 1)) in
    let toSum = intermediateSum @ (generatePadding padCount) in
    ((padCount + 1), (bigAdd currList toSum)) in
  let base = (0, []) in
  let args = l1 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(37,4)-(38,45)
numZeros
VarG

(37,4)-(38,45)
generatePadding
VarG

(37,4)-(38,45)
numZeros
VarG

(37,4)-(38,45)
fun numZeros ->
  if numZeros <= 0
  then []
  else 0 :: (generatePadding (numZeros - 1))
LamG (IteG EmptyG EmptyG EmptyG)

(37,4)-(38,45)
generatePadding (numZeros - 1)
AppG (fromList [BopG EmptyG EmptyG])

(37,4)-(38,45)
numZeros <= 0
BopG VarG LitG

(37,4)-(38,45)
numZeros - 1
BopG VarG LitG

(37,4)-(38,45)
0
LitG

(37,4)-(38,45)
0
LitG

(37,4)-(38,45)
1
LitG

(37,4)-(38,45)
let rec generatePadding =
  fun numZeros ->
    if numZeros <= 0
    then []
    else 0 :: (generatePadding (numZeros - 1)) in
let toSum =
  intermediateSum @ generatePadding padCount in
(padCount + 1 , bigAdd currList
                       toSum)
LetG Rec (fromList [LamG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(37,4)-(38,45)
if numZeros <= 0
then []
else 0 :: (generatePadding (numZeros - 1))
IteG (BopG EmptyG EmptyG) (ListG EmptyG Nothing) (ConAppG (Just EmptyG) Nothing)

(37,4)-(38,45)
0 :: (generatePadding (numZeros - 1))
ConAppG (Just (TupleG (fromList [AppG (fromList [BopG VarG LitG]),LitG]))) Nothing

(37,4)-(38,45)
[]
ListG EmptyG Nothing

(37,35)-(37,37)
(@)
VarG

(37,41)-(37,49)
intermediateSum
VarG

(37,41)-(37,49)
generatePadding
VarG

(37,41)-(37,49)
generatePadding padCount
AppG (fromList [VarG])

(38,5)-(38,19)
padCount + 1
BopG VarG LitG

*)
