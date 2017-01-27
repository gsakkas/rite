
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
      | (h1,h2) -> (match a with | (v1,v2) -> ((v1 + h1) + v2) + h2) in
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
(15,7)-(16,68)
(16,21)-(16,68)
(16,27)-(16,28)
(16,49)-(16,51)
(16,49)-(16,56)
(16,49)-(16,62)
(16,49)-(16,68)
(16,60)-(16,62)
(17,5)-(19,52)
(17,17)-(17,18)
(17,20)-(17,21)
(18,5)-(19,52)
*)

(* type error slice
(14,5)-(19,52)
(14,11)-(16,68)
(14,13)-(16,68)
(15,7)-(16,68)
(15,13)-(15,14)
(16,21)-(16,68)
(16,27)-(16,28)
(16,49)-(16,51)
(16,49)-(16,56)
(16,49)-(16,62)
(16,49)-(16,68)
(16,54)-(16,56)
(16,60)-(16,62)
(16,66)-(16,68)
(17,5)-(19,52)
(17,17)-(17,18)
(17,17)-(17,21)
(17,20)-(17,21)
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
