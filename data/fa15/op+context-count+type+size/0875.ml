
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then
    let n = (List.length l2) - (List.length l1) in (((clone 0 n) @ l1), l2)
  else
    if (List.length l2) < (List.length l1)
    then
      (let n = (List.length l1) - (List.length l2) in
       (l1, ((clone 0 n) @ l2)))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let sumHelper sum =
  let newCarry = sum / 10 in
  let nextDigit = sum mod 10 in (newCarry, nextDigit);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (val1,val2) = x in
      let (lastCarry,lastTupleSum) = a in
      let tupleSum = (val1 + val2) + lastCarry in
      let (newCarry,nextDigit) = sumHelper tupleSum in
      (newCarry, (nextDigit :: lastTupleSum)) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0 then 0 else if i = 1 then l else bigAdd [l] [mulByDigit (i - 1) l];;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then
    let n = (List.length l2) - (List.length l1) in (((clone 0 n) @ l1), l2)
  else
    if (List.length l2) < (List.length l1)
    then
      (let n = (List.length l1) - (List.length l2) in
       (l1, ((clone 0 n) @ l2)))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let sumHelper sum =
  let newCarry = sum / 10 in
  let nextDigit = sum mod 10 in (newCarry, nextDigit);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (val1,val2) = x in
      let (lastCarry,lastTupleSum) = a in
      let tupleSum = (val1 + val2) + lastCarry in
      let (newCarry,nextDigit) = sumHelper tupleSum in
      (newCarry, (nextDigit :: lastTupleSum)) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0 then [0] else if i = 1 then l else bigAdd l (mulByDigit (i - 1) l);;

*)

(* changed spans
(36,16)-(36,17)
(36,51)-(36,54)
(36,55)-(36,77)
*)

(* type error slice
(2,43)-(2,44)
(2,43)-(2,65)
(2,43)-(2,65)
(2,48)-(2,65)
(2,49)-(2,54)
(2,55)-(2,56)
(4,3)-(13,19)
(4,12)-(13,17)
(7,52)-(7,70)
(7,53)-(7,64)
(7,54)-(7,59)
(7,60)-(7,61)
(7,65)-(7,66)
(7,67)-(7,69)
(16,2)-(16,68)
(16,2)-(16,68)
(16,8)-(16,9)
(16,35)-(16,68)
(16,35)-(16,68)
(16,49)-(16,59)
(16,49)-(16,61)
(16,67)-(16,68)
(22,3)-(33,36)
(22,11)-(33,34)
(22,14)-(33,34)
(23,2)-(33,34)
(33,2)-(33,12)
(33,2)-(33,34)
(33,18)-(33,33)
(33,19)-(33,26)
(33,27)-(33,29)
(36,23)-(36,77)
(36,23)-(36,77)
(36,37)-(36,38)
(36,44)-(36,50)
(36,44)-(36,77)
(36,51)-(36,54)
(36,51)-(36,54)
(36,52)-(36,53)
*)
