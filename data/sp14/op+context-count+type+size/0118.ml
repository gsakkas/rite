
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
(17,44)-(17,56)
(17,45)-(17,50)
(17,51)-(17,52)
(17,58)-(17,70)
(17,59)-(17,64)
(17,65)-(17,66)
(17,67)-(17,69)
(18,4)-(20,51)
*)

(* type error slice
(2,34)-(2,35)
(2,34)-(2,56)
(2,34)-(2,56)
(2,39)-(2,56)
(2,40)-(2,45)
(2,46)-(2,47)
(4,3)-(7,79)
(4,12)-(7,77)
(4,15)-(7,77)
(5,2)-(7,77)
(6,7)-(6,77)
(6,21)-(6,68)
(6,22)-(6,27)
(6,28)-(6,29)
(6,74)-(6,76)
(7,12)-(7,76)
(7,13)-(7,24)
(7,25)-(7,72)
(7,26)-(7,31)
(7,73)-(7,75)
(13,2)-(21,34)
(13,11)-(20,51)
(14,4)-(20,51)
(14,10)-(17,72)
(14,12)-(17,72)
(15,6)-(17,72)
(15,12)-(15,13)
(17,58)-(17,70)
(17,65)-(17,66)
(17,67)-(17,69)
(19,4)-(20,51)
(19,15)-(19,27)
(19,15)-(19,33)
(19,31)-(19,33)
(20,18)-(20,32)
(20,18)-(20,44)
(20,33)-(20,34)
(20,40)-(20,44)
(21,13)-(21,34)
(21,14)-(21,17)
(21,18)-(21,33)
(21,19)-(21,26)
*)
