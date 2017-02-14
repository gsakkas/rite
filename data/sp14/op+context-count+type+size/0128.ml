
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
(18,25)-(18,41)
(18,43)-(18,72)
(19,4)-(21,51)
(20,4)-(21,51)
(21,4)-(21,51)
*)

(* type error slice
(14,4)-(21,51)
(14,10)-(18,74)
(14,12)-(18,74)
(15,6)-(18,74)
(17,10)-(18,74)
(18,24)-(18,73)
(18,25)-(18,41)
(19,4)-(21,51)
(19,15)-(19,23)
(19,16)-(19,18)
(21,18)-(21,32)
(21,18)-(21,44)
(21,33)-(21,34)
(21,35)-(21,39)
*)
