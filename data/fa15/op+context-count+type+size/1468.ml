
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
