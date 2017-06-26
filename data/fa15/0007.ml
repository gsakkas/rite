
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

let rec mulByDigit i l = if i = 0 then [] else bigAdd l mulByDigit (i - 1) l;;


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
  if i = 0 then [] else bigAdd l (mulByDigit (i - 1) l);;

*)

(* changed spans
(30,47)-(30,76)
(30,56)-(30,66)
*)

(* type error slice
(14,2)-(14,60)
(14,23)-(14,25)
(14,36)-(14,46)
(14,36)-(14,48)
(16,3)-(28,36)
(16,11)-(28,34)
(16,14)-(28,34)
(17,2)-(28,34)
(28,2)-(28,12)
(28,2)-(28,34)
(30,47)-(30,53)
(30,47)-(30,76)
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
(30,19)-(30,76)
(30,21)-(30,76)
(30,25)-(30,76)
(30,28)-(30,33)
(30,28)-(30,29)
(30,32)-(30,33)
(30,39)-(30,41)
(30,47)-(30,76)
(30,47)-(30,53)
(30,54)-(30,55)
(30,56)-(30,66)
(30,67)-(30,74)
(30,68)-(30,69)
(30,72)-(30,73)
(30,75)-(30,76)
*)
