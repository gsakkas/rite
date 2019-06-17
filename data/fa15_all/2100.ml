
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
  if i = 0
  then 0
  else if i = 1 then l else bigAdd [l] [mulByDigit ((i - 1), l)];;


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
(37,8)-(37,9)
[0]
ListG [LitG]

(38,36)-(38,39)
l
VarG

(38,40)-(38,65)
mulByDigit (i - 1) l
AppG [BopG EmptyG EmptyG,VarG]

*)

(* type error slice
(2,44)-(2,45)
(2,44)-(2,66)
(2,49)-(2,66)
(2,50)-(2,55)
(2,56)-(2,57)
(4,4)-(13,20)
(4,13)-(13,18)
(7,53)-(7,71)
(7,54)-(7,65)
(7,55)-(7,60)
(7,61)-(7,62)
(7,66)-(7,67)
(7,68)-(7,70)
(16,3)-(16,69)
(16,9)-(16,10)
(16,36)-(16,69)
(16,50)-(16,60)
(16,50)-(16,62)
(16,68)-(16,69)
(22,4)-(33,37)
(22,12)-(33,35)
(22,15)-(33,35)
(23,3)-(33,35)
(33,3)-(33,13)
(33,3)-(33,35)
(33,19)-(33,34)
(33,20)-(33,27)
(33,28)-(33,30)
(35,4)-(38,67)
(35,20)-(38,65)
(36,3)-(38,65)
(36,6)-(36,7)
(36,6)-(36,11)
(36,10)-(36,11)
(37,8)-(37,9)
(38,8)-(38,65)
(38,22)-(38,23)
(38,29)-(38,35)
(38,29)-(38,65)
(38,36)-(38,39)
(38,37)-(38,38)
(38,41)-(38,51)
(38,41)-(38,64)
(38,52)-(38,64)
*)
