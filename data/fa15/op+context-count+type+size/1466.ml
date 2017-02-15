
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
(23,8)-(27,52)
(24,9)-(27,51)
(25,9)-(27,51)
(26,9)-(27,51)
(27,18)-(27,35)
(28,4)-(30,51)
(29,4)-(30,51)
(30,4)-(30,51)
(31,14)-(31,17)
*)

(* type error slice
(18,4)-(30,51)
(18,10)-(27,52)
(18,12)-(27,52)
(20,9)-(20,10)
(20,9)-(20,15)
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
