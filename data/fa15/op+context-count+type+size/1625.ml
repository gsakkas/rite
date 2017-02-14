
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
(37,5)-(38,44)
(37,17)-(37,32)
(37,17)-(37,50)
(37,36)-(37,38)
(37,36)-(37,50)
(37,39)-(37,41)
(37,42)-(37,50)
(38,7)-(38,19)
(39,3)-(40,67)
(39,15)-(39,16)
(39,15)-(39,20)
(39,18)-(39,20)
(40,3)-(40,67)
(40,14)-(40,16)
(40,20)-(40,67)
(40,34)-(40,48)
(40,34)-(40,60)
(40,49)-(40,50)
(40,51)-(40,55)
(40,56)-(40,60)
(40,64)-(40,67)
*)

(* type error slice
(4,4)-(11,80)
(4,13)-(11,76)
(4,16)-(11,76)
(11,33)-(11,47)
(11,43)-(11,44)
(11,45)-(11,47)
(16,4)-(28,37)
(16,12)-(28,33)
(16,15)-(28,33)
(28,20)-(28,27)
(28,20)-(28,33)
(28,31)-(28,33)
(31,26)-(31,32)
(31,26)-(31,56)
(31,36)-(31,46)
(31,36)-(31,56)
(36,5)-(38,44)
(36,27)-(36,37)
(36,27)-(36,42)
(37,5)-(38,44)
(37,17)-(37,32)
(37,17)-(37,50)
(37,17)-(37,50)
(37,36)-(37,38)
(37,36)-(37,50)
(37,39)-(37,41)
(38,23)-(38,29)
(38,23)-(38,44)
(38,39)-(38,44)
*)
