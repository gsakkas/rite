
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (v1,v2) ->
          (match a with | (list1,list2) -> ((list1 @ v1), (list2 @ v2))) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (v1,v2) ->
          (match a with | (list1,list2) -> ((v1 :: list1), (v2 :: list2))) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(17,46)-(17,51)
(17,46)-(17,56)
(17,52)-(17,53)
(17,60)-(17,65)
(17,60)-(17,70)
(17,66)-(17,67)
(17,68)-(17,70)
(18,5)-(20,52)
(18,17)-(18,19)
(18,17)-(18,23)
*)

(* type error slice
(2,41)-(2,46)
(2,41)-(2,55)
(2,47)-(2,48)
(2,50)-(2,55)
(4,4)-(7,80)
(4,13)-(7,76)
(4,16)-(7,76)
(5,3)-(7,76)
(5,7)-(5,18)
(5,7)-(5,21)
(5,19)-(5,21)
(5,26)-(5,37)
(5,26)-(5,40)
(5,38)-(5,40)
(6,10)-(6,21)
(6,10)-(6,72)
(6,10)-(6,77)
(6,23)-(6,28)
(6,23)-(6,66)
(6,29)-(6,30)
(6,33)-(6,66)
(6,70)-(6,72)
(6,75)-(6,77)
(13,3)-(21,33)
(13,12)-(20,52)
(14,5)-(20,52)
(14,11)-(17,70)
(14,13)-(17,70)
(15,7)-(17,70)
(15,13)-(15,14)
(17,12)-(17,70)
(17,18)-(17,19)
(17,46)-(17,51)
(17,46)-(17,56)
(17,46)-(17,70)
(17,52)-(17,53)
(17,54)-(17,56)
(17,60)-(17,65)
(17,60)-(17,70)
(17,66)-(17,67)
(17,68)-(17,70)
(18,5)-(20,52)
(18,17)-(18,19)
(18,17)-(18,23)
(18,21)-(18,23)
(19,5)-(20,52)
(19,16)-(19,28)
(19,16)-(19,34)
(19,29)-(19,31)
(19,32)-(19,34)
(20,5)-(20,52)
(20,19)-(20,33)
(20,19)-(20,45)
(20,34)-(20,35)
(20,36)-(20,40)
(20,41)-(20,45)
(20,49)-(20,52)
(21,15)-(21,18)
(21,15)-(21,33)
(21,20)-(21,27)
(21,20)-(21,33)
(21,28)-(21,30)
(21,31)-(21,33)
*)
