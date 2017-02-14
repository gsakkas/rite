
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
      | (h1,h2) -> (match a with | (v1,v2) -> ((v1 + h1), (v2 + h2))) in
    let base = (0, 0) in
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
      match a with
      | (list1,list2) ->
          (match list1 with
           | [] -> (match x with | (h1,h2) -> (((h1 + h2) :: list1), list2))) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,7)-(16,67)
(16,21)-(16,67)
(16,27)-(16,28)
(16,49)-(16,51)
(16,49)-(16,56)
(16,60)-(16,62)
(16,60)-(16,67)
(17,5)-(19,52)
(17,17)-(17,18)
(17,17)-(17,21)
(17,20)-(17,21)
(18,5)-(19,52)
(18,16)-(18,34)
(19,5)-(19,52)
*)

(* type error slice
(10,3)-(10,70)
(10,3)-(10,70)
(10,51)-(10,61)
(10,51)-(10,63)
(10,62)-(10,63)
(13,3)-(20,33)
(13,12)-(19,52)
(14,5)-(19,52)
(14,5)-(19,52)
(14,11)-(16,67)
(16,21)-(16,67)
(16,27)-(16,28)
(16,60)-(16,62)
(16,60)-(16,67)
(17,5)-(19,52)
(18,5)-(19,52)
(19,5)-(19,52)
(19,5)-(19,52)
(19,19)-(19,33)
(19,19)-(19,45)
(19,34)-(19,35)
(19,49)-(19,52)
(20,3)-(20,13)
(20,3)-(20,33)
(20,15)-(20,18)
(20,15)-(20,33)
*)
