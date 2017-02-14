
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

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (val1,val2) = x in
      let (lastCarry,lastTupleSum) = a in
      let tupleSum = (val1 + val2) + lastCarry in
      let newCarry = tupleSum / 10 in
      let nextDigit = tupleSum mod 10 in
      (newCarry, (nextDigit :: lastTupleSum)) in
    let base = (0, []) in
    let args = List.rev ((List.combine 0) :: (l1 0) :: l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


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

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (val1,val2) = x in
      let (lastCarry,lastTupleSum) = a in
      let tupleSum = (val1 + val2) + lastCarry in
      let newCarry = tupleSum / 10 in
      let nextDigit = tupleSum mod 10 in
      (newCarry, (nextDigit :: lastTupleSum)) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(28,24)-(28,58)
(28,25)-(28,41)
(28,39)-(28,40)
(28,45)-(28,51)
(28,49)-(28,50)
*)

(* type error slice
(20,4)-(29,51)
(20,10)-(26,45)
(20,12)-(26,45)
(21,6)-(26,45)
(21,24)-(21,25)
(28,4)-(29,51)
(28,15)-(28,23)
(28,15)-(28,58)
(28,24)-(28,58)
(28,24)-(28,58)
(28,25)-(28,41)
(28,26)-(28,38)
(28,39)-(28,40)
(29,18)-(29,32)
(29,18)-(29,44)
(29,33)-(29,34)
(29,40)-(29,44)
*)
