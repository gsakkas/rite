
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
(37,35)-(37,37)
(37,38)-(37,40)
(37,41)-(37,49)
(38,5)-(38,19)
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
(37,34)-(37,50)
(37,35)-(37,37)
(37,38)-(37,40)
(38,21)-(38,44)
(38,22)-(38,28)
(38,38)-(38,43)
*)

(* all spans
(2,14)-(2,65)
(2,16)-(2,65)
(2,20)-(2,65)
(2,23)-(2,29)
(2,23)-(2,24)
(2,28)-(2,29)
(2,35)-(2,37)
(2,43)-(2,65)
(2,43)-(2,44)
(2,48)-(2,65)
(2,49)-(2,54)
(2,55)-(2,56)
(2,57)-(2,64)
(2,58)-(2,59)
(2,62)-(2,63)
(4,12)-(11,77)
(4,15)-(11,77)
(5,2)-(11,77)
(5,17)-(5,52)
(5,17)-(5,33)
(5,18)-(5,29)
(5,30)-(5,32)
(5,36)-(5,52)
(5,37)-(5,48)
(5,49)-(5,51)
(6,2)-(11,77)
(6,20)-(6,32)
(6,20)-(6,23)
(6,24)-(6,32)
(7,2)-(11,77)
(7,5)-(7,17)
(7,5)-(7,13)
(7,16)-(7,17)
(8,7)-(8,15)
(8,8)-(8,10)
(8,12)-(8,14)
(10,4)-(11,77)
(10,21)-(10,40)
(10,21)-(10,26)
(10,27)-(10,28)
(10,29)-(10,40)
(11,5)-(11,76)
(11,8)-(11,20)
(11,8)-(11,16)
(11,19)-(11,20)
(11,26)-(11,48)
(11,27)-(11,29)
(11,31)-(11,47)
(11,42)-(11,43)
(11,32)-(11,41)
(11,44)-(11,46)
(11,54)-(11,76)
(11,55)-(11,71)
(11,66)-(11,67)
(11,56)-(11,65)
(11,68)-(11,70)
(11,73)-(11,75)
(13,19)-(14,60)
(14,2)-(14,60)
(14,8)-(14,9)
(14,23)-(14,25)
(14,36)-(14,48)
(14,36)-(14,46)
(14,47)-(14,48)
(14,59)-(14,60)
(16,11)-(28,34)
(16,14)-(28,34)
(17,2)-(28,34)
(17,11)-(27,51)
(18,4)-(27,51)
(18,10)-(24,57)
(18,12)-(24,57)
(19,6)-(24,57)
(19,41)-(19,42)
(20,6)-(24,57)
(20,28)-(20,29)
(21,6)-(24,57)
(21,30)-(21,62)
(21,30)-(21,47)
(21,31)-(21,37)
(21,40)-(21,46)
(21,50)-(21,62)
(22,6)-(24,57)
(22,30)-(22,54)
(22,30)-(22,47)
(22,52)-(22,54)
(23,6)-(24,57)
(23,18)-(23,40)
(23,18)-(23,35)
(23,38)-(23,40)
(24,6)-(24,57)
(24,7)-(24,12)
(24,14)-(24,56)
(24,15)-(24,20)
(24,24)-(24,55)
(24,24)-(24,41)
(24,45)-(24,55)
(25,4)-(27,51)
(25,15)-(25,23)
(25,16)-(25,17)
(25,19)-(25,22)
(25,20)-(25,21)
(26,4)-(27,51)
(26,15)-(26,44)
(26,15)-(26,23)
(26,24)-(26,44)
(26,25)-(26,37)
(26,38)-(26,40)
(26,41)-(26,43)
(27,4)-(27,51)
(27,18)-(27,44)
(27,18)-(27,32)
(27,33)-(27,34)
(27,35)-(27,39)
(27,40)-(27,44)
(27,48)-(27,51)
(28,2)-(28,34)
(28,2)-(28,12)
(28,13)-(28,34)
(28,14)-(28,17)
(28,18)-(28,33)
(28,19)-(28,26)
(28,27)-(28,29)
(28,30)-(28,32)
(30,19)-(31,56)
(30,21)-(31,56)
(31,2)-(31,56)
(31,5)-(31,11)
(31,5)-(31,6)
(31,10)-(31,11)
(31,17)-(31,19)
(31,25)-(31,56)
(31,25)-(31,31)
(31,32)-(31,33)
(31,34)-(31,56)
(31,35)-(31,45)
(31,46)-(31,53)
(31,47)-(31,48)
(31,51)-(31,52)
(31,54)-(31,55)
(33,11)-(40,66)
(33,14)-(40,66)
(34,2)-(40,66)
(34,8)-(38,45)
(34,10)-(38,45)
(35,4)-(38,45)
(35,30)-(35,31)
(36,4)-(38,45)
(36,26)-(36,41)
(36,26)-(36,36)
(36,37)-(36,38)
(36,39)-(36,41)
(37,4)-(38,45)
(37,16)-(37,50)
(37,16)-(37,31)
(37,34)-(37,50)
(37,38)-(37,40)
(37,35)-(37,37)
(37,41)-(37,49)
(38,4)-(38,45)
(38,5)-(38,19)
(38,6)-(38,14)
(38,17)-(38,18)
(38,21)-(38,44)
(38,22)-(38,28)
(38,29)-(38,37)
(38,38)-(38,43)
(39,2)-(40,66)
(39,13)-(39,20)
(39,14)-(39,15)
(39,17)-(39,19)
(40,2)-(40,66)
(40,13)-(40,15)
(40,19)-(40,66)
(40,33)-(40,59)
(40,33)-(40,47)
(40,48)-(40,49)
(40,50)-(40,54)
(40,55)-(40,59)
(40,63)-(40,66)
*)
