
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
(15,6)-(16,69)
(16,19)-(16,69)
(16,26)-(16,27)
(16,47)-(16,56)
(16,48)-(16,50)
(16,58)-(16,67)
(16,59)-(16,61)
(17,4)-(19,51)
(17,15)-(17,21)
(17,16)-(17,17)
(17,19)-(17,20)
(18,4)-(19,51)
(18,15)-(18,33)
(19,4)-(19,51)
*)

(* type error slice
(10,2)-(10,69)
(10,2)-(10,69)
(10,50)-(10,60)
(10,50)-(10,62)
(10,61)-(10,62)
(13,2)-(20,34)
(13,11)-(19,51)
(14,4)-(19,51)
(14,4)-(19,51)
(14,10)-(16,69)
(16,19)-(16,69)
(16,26)-(16,27)
(16,58)-(16,67)
(16,59)-(16,61)
(17,4)-(19,51)
(18,4)-(19,51)
(19,4)-(19,51)
(19,4)-(19,51)
(19,18)-(19,32)
(19,18)-(19,44)
(19,33)-(19,34)
(19,48)-(19,51)
(20,2)-(20,12)
(20,2)-(20,34)
(20,13)-(20,34)
(20,14)-(20,17)
*)
