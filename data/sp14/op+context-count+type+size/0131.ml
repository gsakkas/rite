
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
           | ([],[]) -> a
           | (h1,h2) -> ([(h1 + h2) / 10], [(h1 + h2) mod 10])) in
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
          (match x with | (h1,h2) -> ([(h1 + h2) / 10], [(h1 + h2) mod 10])) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(17,10)-(19,63)
(18,24)-(18,25)
(20,4)-(22,51)
(21,4)-(22,51)
(22,4)-(22,51)
*)

(* type error slice
(2,34)-(2,35)
(2,34)-(2,56)
(2,34)-(2,56)
(2,39)-(2,56)
(2,40)-(2,45)
(2,46)-(2,47)
(4,3)-(7,79)
(4,12)-(7,77)
(4,15)-(7,77)
(5,2)-(7,77)
(6,7)-(6,77)
(6,21)-(6,68)
(6,22)-(6,27)
(6,28)-(6,29)
(6,74)-(6,76)
(7,12)-(7,76)
(7,13)-(7,24)
(7,25)-(7,72)
(7,26)-(7,31)
(7,73)-(7,75)
(13,2)-(23,34)
(13,11)-(22,51)
(14,4)-(22,51)
(14,10)-(19,63)
(14,12)-(19,63)
(17,10)-(19,63)
(17,10)-(19,63)
(17,10)-(19,63)
(17,10)-(19,63)
(17,17)-(17,18)
(19,26)-(19,35)
(19,27)-(19,29)
(21,4)-(22,51)
(21,15)-(21,27)
(21,15)-(21,33)
(21,31)-(21,33)
(22,18)-(22,32)
(22,18)-(22,44)
(22,33)-(22,34)
(22,40)-(22,44)
(23,13)-(23,34)
(23,14)-(23,17)
(23,18)-(23,33)
(23,19)-(23,26)
*)
