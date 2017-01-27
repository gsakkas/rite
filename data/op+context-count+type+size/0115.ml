
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = x in
    let base = List.rev l1 in
    let args = List.rev l2 in let (_,res) = List.fold_left f base args in res in
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
(14,17)-(14,18)
(15,5)-(16,78)
(15,16)-(15,24)
(15,16)-(15,27)
(15,25)-(15,27)
(16,5)-(16,78)
(16,16)-(16,24)
(16,16)-(16,27)
(16,25)-(16,27)
(17,3)-(17,13)
(17,15)-(17,18)
(17,15)-(17,33)
(17,20)-(17,27)
(17,20)-(17,33)
(17,28)-(17,30)
(17,31)-(17,33)
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
(13,3)-(17,33)
(13,12)-(16,78)
(14,5)-(16,78)
(14,11)-(14,18)
(14,13)-(14,18)
(14,17)-(14,18)
(15,5)-(16,78)
(15,16)-(15,24)
(15,16)-(15,27)
(15,25)-(15,27)
(16,5)-(16,78)
(16,16)-(16,24)
(16,16)-(16,27)
(16,25)-(16,27)
(16,31)-(16,78)
(16,45)-(16,59)
(16,45)-(16,71)
(16,60)-(16,61)
(16,62)-(16,66)
(16,67)-(16,71)
(16,75)-(16,78)
(17,15)-(17,18)
(17,15)-(17,33)
(17,20)-(17,27)
(17,20)-(17,33)
(17,28)-(17,30)
(17,31)-(17,33)
*)
