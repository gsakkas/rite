
let rec clone x n =
  let rec helper a b acc = if b > 0 then helper a (b - 1) (a :: acc) else acc in
  helper x n [];;

let padZero l1 l2 =
  let l1_len = List.length l1 in
  let l2_len = List.length l2 in
  let l_diff = l1_len - l2_len in
  if l_diff < 0
  then (((clone 0 (l_diff * (-1))) @ l1), l2)
  else (l1, ((clone 0 l_diff) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = ([x :: a], [x :: a]) in
    let base = ([], []) in
    let args = l1 in let (bar,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec helper a b acc = if b > 0 then helper a (b - 1) (a :: acc) else acc in
  helper x n [];;

let padZero l1 l2 =
  let l1_len = List.length l1 in
  let l2_len = List.length l2 in
  let l_diff = l1_len - l2_len in
  if l_diff < 0
  then (((clone 0 (l_diff * (-1))) @ l1), l2)
  else (l1, ((clone 0 l_diff) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = ([x + 1], [x + 1]) in
    let base = ([], []) in
    let args = l1 in let (bar,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,19)-(19,25)
(19,24)-(19,25)
(19,29)-(19,35)
(19,34)-(19,35)
(20,5)-(21,71)
(20,17)-(20,19)
(20,17)-(20,23)
*)

(* type error slice
(19,5)-(21,71)
(19,11)-(19,36)
(19,13)-(19,36)
(19,18)-(19,26)
(19,18)-(19,36)
(19,19)-(19,20)
(19,19)-(19,25)
(19,24)-(19,25)
(19,28)-(19,36)
(19,29)-(19,35)
(20,5)-(21,71)
(20,17)-(20,19)
(20,17)-(20,23)
(20,21)-(20,23)
(21,5)-(21,71)
(21,16)-(21,18)
(21,38)-(21,52)
(21,38)-(21,64)
(21,53)-(21,54)
(21,55)-(21,59)
(21,60)-(21,64)
*)
