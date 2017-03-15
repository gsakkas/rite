
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
    let f a x = failwith "to be implemented" in
    let base = 0 in
    let args = failwith "to be implemented" in
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
      let (carry,currentSum) = a in
      let (toSum1,toSum2) = x in
      let intermediateValue = (toSum1 + toSum2) + carry in
      let valueToAddToArray = intermediateValue mod 10 in
      let carry = intermediateValue / 10 in
      (carry, (valueToAddToArray :: currentSum)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,16)-(18,24)
(18,16)-(18,44)
(18,25)-(18,44)
(19,4)-(21,51)
(19,15)-(19,16)
(20,4)-(21,51)
(20,15)-(20,23)
(20,24)-(20,43)
(21,4)-(21,51)
*)

(* type error slice
(19,4)-(21,51)
(19,15)-(19,16)
(21,4)-(21,51)
(21,18)-(21,32)
(21,18)-(21,44)
(21,35)-(21,39)
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
(16,11)-(22,34)
(16,14)-(22,34)
(17,2)-(22,34)
(17,11)-(21,51)
(18,4)-(21,51)
(18,10)-(18,44)
(18,12)-(18,44)
(18,16)-(18,44)
(18,16)-(18,24)
(18,25)-(18,44)
(19,4)-(21,51)
(19,15)-(19,16)
(20,4)-(21,51)
(20,15)-(20,43)
(20,15)-(20,23)
(20,24)-(20,43)
(21,4)-(21,51)
(21,18)-(21,44)
(21,18)-(21,32)
(21,33)-(21,34)
(21,35)-(21,39)
(21,40)-(21,44)
(21,48)-(21,51)
(22,2)-(22,34)
(22,2)-(22,12)
(22,13)-(22,34)
(22,14)-(22,17)
(22,18)-(22,33)
(22,19)-(22,26)
(22,27)-(22,29)
(22,30)-(22,32)
*)
