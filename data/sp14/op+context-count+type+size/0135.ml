
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
(16,19)-(16,69)
(16,54)-(16,55)
(16,65)-(16,66)
(17,4)-(19,51)
(17,15)-(17,23)
(18,4)-(19,51)
(19,4)-(19,51)
*)

(* type error slice
(14,4)-(19,51)
(14,10)-(16,69)
(14,12)-(16,69)
(15,6)-(16,69)
(16,19)-(16,69)
(16,19)-(16,69)
(16,26)-(16,27)
(16,46)-(16,68)
(16,58)-(16,67)
(16,65)-(16,66)
(19,18)-(19,32)
(19,18)-(19,44)
(19,33)-(19,34)
*)
