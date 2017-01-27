
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
      | (v1,v2) -> (match a with | ([],[]) -> ((v1 :: a), (v2 :: a))) in
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
(16,21)-(16,67)
(16,55)-(16,56)
(16,66)-(16,67)
(17,5)-(19,52)
(17,17)-(17,19)
(17,17)-(17,23)
*)

(* type error slice
(14,5)-(19,52)
(14,11)-(16,67)
(14,13)-(16,67)
(15,7)-(16,67)
(15,13)-(15,14)
(16,21)-(16,67)
(16,27)-(16,28)
(16,49)-(16,51)
(16,49)-(16,56)
(16,49)-(16,67)
(16,55)-(16,56)
(16,60)-(16,62)
(16,60)-(16,67)
(16,66)-(16,67)
(17,5)-(19,52)
(17,17)-(17,19)
(17,17)-(17,23)
(17,21)-(17,23)
(18,5)-(19,52)
(18,16)-(18,28)
(18,16)-(18,34)
(18,29)-(18,31)
(18,32)-(18,34)
(19,19)-(19,33)
(19,19)-(19,45)
(19,34)-(19,35)
(19,36)-(19,40)
(19,41)-(19,45)
*)
