
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
(37,16)-(37,31)
(37,16)-(37,50)
(37,34)-(37,50)
(37,35)-(37,37)
(37,38)-(37,40)
(37,41)-(37,49)
(38,5)-(38,19)
(39,2)-(40,66)
(39,13)-(39,20)
(39,14)-(39,15)
(39,17)-(39,19)
(40,2)-(40,66)
(40,13)-(40,15)
(40,19)-(40,66)
(40,33)-(40,47)
(40,33)-(40,59)
(40,48)-(40,49)
(40,50)-(40,54)
(40,55)-(40,59)
(40,63)-(40,66)
*)

(* type error slice
(4,3)-(11,79)
(4,12)-(11,77)
(4,15)-(11,77)
(11,31)-(11,47)
(11,42)-(11,43)
(11,44)-(11,46)
(16,3)-(28,36)
(16,11)-(28,34)
(16,14)-(28,34)
(28,18)-(28,33)
(28,19)-(28,26)
(28,30)-(28,32)
(31,25)-(31,31)
(31,25)-(31,56)
(31,34)-(31,56)
(31,35)-(31,45)
(36,4)-(38,45)
(36,26)-(36,36)
(36,26)-(36,41)
(37,4)-(38,45)
(37,16)-(37,31)
(37,16)-(37,50)
(37,16)-(37,50)
(37,34)-(37,50)
(37,35)-(37,37)
(37,38)-(37,40)
(38,21)-(38,44)
(38,22)-(38,28)
(38,38)-(38,43)
*)
