
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
      | ([],[]) ->
          (match x with
           | (h1,h2) -> ([(h1 + h2) / 10], [(h1 + h2) mod 10])
           | (list1,list2) -> (list1, list2)) in
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
      | ([],[]) ->
          (match x with
           | (h1,h2) -> ([(h1 + h2) / 10], [(h1 + h2) mod 10])
           | (list1,list2) -> ([1], [1])) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,32)-(19,37)
(19,39)-(19,44)
(20,5)-(22,52)
(20,17)-(20,19)
(20,17)-(20,23)
*)

(* type error slice
(17,12)-(19,44)
(18,26)-(18,42)
(18,26)-(18,62)
(18,28)-(18,41)
(18,44)-(18,62)
(18,46)-(18,61)
(19,32)-(19,37)
(19,32)-(19,44)
(19,39)-(19,44)
*)
