
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
      let (carry,currentSum) = a in
      if x = []
      then (0, (carry :: currentSum))
      else
        (let (toSum1,toSum2) = x in
         let intermediateValue = (toSum1 + toSum2) + carry in
         let valueToAddToArray = intermediateValue mod 10 in
         let carry = intermediateValue / 10 in
         (carry, (valueToAddToArray :: currentSum))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


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
      let (carry,currentCarry::currentSum) = a in
      let (toSum1,toSum2) = x in
      let intermediateValue = (toSum1 + toSum2) + carry in
      let valueToAddToArray = intermediateValue mod 10 in
      let carry = intermediateValue / 10 in
      (carry, (carry :: valueToAddToArray :: currentSum)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,6)-(27,52)
(20,6)-(27,52)
(20,9)-(20,10)
(20,9)-(20,15)
(20,13)-(20,15)
(21,11)-(21,37)
(21,12)-(21,13)
(21,15)-(21,36)
(21,16)-(21,21)
(21,25)-(21,35)
(27,18)-(27,35)
*)

(* type error slice
(18,4)-(30,51)
(18,10)-(27,52)
(18,12)-(27,52)
(20,9)-(20,10)
(20,9)-(20,15)
(20,13)-(20,15)
(23,8)-(27,52)
(23,31)-(23,32)
(29,4)-(30,51)
(29,15)-(29,23)
(29,15)-(29,44)
(29,24)-(29,44)
(29,25)-(29,37)
(30,18)-(30,32)
(30,18)-(30,44)
(30,33)-(30,34)
(30,40)-(30,44)
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
(16,11)-(31,34)
(16,14)-(31,34)
(17,2)-(31,34)
(17,11)-(30,51)
(18,4)-(30,51)
(18,10)-(27,52)
(18,12)-(27,52)
(19,6)-(27,52)
(19,31)-(19,32)
(20,6)-(27,52)
(20,9)-(20,15)
(20,9)-(20,10)
(20,13)-(20,15)
(21,11)-(21,37)
(21,12)-(21,13)
(21,15)-(21,36)
(21,16)-(21,21)
(21,25)-(21,35)
(23,8)-(27,52)
(23,31)-(23,32)
(24,9)-(27,51)
(24,33)-(24,58)
(24,33)-(24,50)
(24,34)-(24,40)
(24,43)-(24,49)
(24,53)-(24,58)
(25,9)-(27,51)
(25,33)-(25,57)
(25,33)-(25,50)
(25,55)-(25,57)
(26,9)-(27,51)
(26,21)-(26,43)
(26,21)-(26,38)
(26,41)-(26,43)
(27,9)-(27,51)
(27,10)-(27,15)
(27,17)-(27,50)
(27,18)-(27,35)
(27,39)-(27,49)
(28,4)-(30,51)
(28,15)-(28,22)
(28,16)-(28,17)
(28,19)-(28,21)
(29,4)-(30,51)
(29,15)-(29,44)
(29,15)-(29,23)
(29,24)-(29,44)
(29,25)-(29,37)
(29,38)-(29,40)
(29,41)-(29,43)
(30,4)-(30,51)
(30,18)-(30,44)
(30,18)-(30,32)
(30,33)-(30,34)
(30,35)-(30,39)
(30,40)-(30,44)
(30,48)-(30,51)
(31,2)-(31,34)
(31,2)-(31,12)
(31,13)-(31,34)
(31,14)-(31,17)
(31,18)-(31,33)
(31,19)-(31,26)
(31,27)-(31,29)
(31,30)-(31,32)
*)
