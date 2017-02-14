
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
          (match a with
           | (list1,list2) ->
               ((List.append list1 v1), (List.append list2 v2))) in
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
(19,18)-(19,29)
(19,18)-(19,38)
(19,30)-(19,35)
(19,42)-(19,53)
(19,42)-(19,62)
(19,54)-(19,59)
(19,60)-(19,62)
(20,5)-(22,52)
(20,17)-(20,23)
(21,5)-(22,52)
(22,5)-(22,52)
*)

(* type error slice
(2,35)-(2,36)
(2,35)-(2,55)
(2,35)-(2,55)
(2,41)-(2,46)
(2,41)-(2,55)
(2,47)-(2,48)
(4,4)-(7,80)
(4,13)-(7,76)
(4,16)-(7,76)
(5,3)-(7,76)
(6,10)-(6,77)
(6,23)-(6,28)
(6,23)-(6,66)
(6,29)-(6,30)
(6,75)-(6,77)
(7,14)-(7,25)
(7,14)-(7,76)
(7,27)-(7,32)
(7,27)-(7,70)
(7,74)-(7,76)
(13,3)-(23,33)
(13,12)-(22,52)
(14,5)-(22,52)
(14,11)-(19,62)
(14,13)-(19,62)
(15,7)-(19,62)
(15,13)-(15,14)
(19,42)-(19,53)
(19,42)-(19,62)
(19,60)-(19,62)
(21,5)-(22,52)
(21,16)-(21,28)
(21,16)-(21,34)
(21,32)-(21,34)
(22,19)-(22,33)
(22,19)-(22,45)
(22,34)-(22,35)
(22,41)-(22,45)
(23,15)-(23,18)
(23,15)-(23,33)
(23,20)-(23,27)
(23,20)-(23,33)
*)
