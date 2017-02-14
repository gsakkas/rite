
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
      if x = ()
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
(19,7)-(27,50)
(20,7)-(27,50)
(20,10)-(20,11)
(20,10)-(20,16)
(20,14)-(20,16)
(21,13)-(21,14)
(21,13)-(21,36)
(21,17)-(21,22)
(21,17)-(21,36)
(21,26)-(21,36)
(23,10)-(27,50)
(24,10)-(27,50)
(25,10)-(27,50)
(26,10)-(27,50)
(27,19)-(27,36)
(28,5)-(30,52)
(29,5)-(30,52)
(30,5)-(30,52)
*)

(* type error slice
(18,5)-(30,52)
(18,11)-(27,50)
(18,13)-(27,50)
(20,10)-(20,11)
(20,10)-(20,16)
(20,10)-(20,16)
(20,14)-(20,16)
(23,10)-(27,50)
(23,32)-(23,33)
(29,5)-(30,52)
(29,16)-(29,24)
(29,16)-(29,44)
(29,26)-(29,38)
(29,26)-(29,44)
(30,19)-(30,33)
(30,19)-(30,45)
(30,34)-(30,35)
(30,41)-(30,45)
*)
