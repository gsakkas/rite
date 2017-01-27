
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
          (match x with
           | (h1,h2) -> (((h1 + h2) / 10), (((h1 + h2) mod 10) :: list2))) in
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
      match a with
      | (list1,list2) ->
          (match x with
           | (h1,h2) ->
               ((((h1 + h2) / 10) :: list1), (((h1 + h2) mod 10) :: list2))) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,28)-(18,41)
(18,47)-(18,72)
(19,17)-(19,19)
(19,21)-(19,23)
*)

(* type error slice
(14,5)-(21,52)
(14,11)-(18,72)
(14,13)-(18,72)
(15,7)-(18,72)
(15,13)-(15,14)
(17,12)-(18,72)
(17,18)-(17,19)
(18,28)-(18,30)
(18,28)-(18,35)
(18,28)-(18,41)
(18,28)-(18,72)
(18,33)-(18,35)
(18,47)-(18,62)
(18,47)-(18,72)
(18,67)-(18,72)
(19,5)-(21,52)
(19,17)-(19,19)
(19,17)-(19,23)
(19,21)-(19,23)
(20,5)-(21,52)
(20,16)-(20,28)
(20,16)-(20,34)
(20,29)-(20,31)
(20,32)-(20,34)
(21,19)-(21,33)
(21,19)-(21,45)
(21,34)-(21,35)
(21,36)-(21,40)
(21,41)-(21,45)
*)
