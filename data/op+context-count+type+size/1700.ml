
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
    let f a x = (x + x) :: a in
    let base = ([], []) in
    let args = [(l1, l2)] in let (_,res) = List.fold_left f base args in res in
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
    let args = l1 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,18)-(19,23)
(19,18)-(19,29)
(19,22)-(19,23)
(19,28)-(19,29)
(20,5)-(21,77)
(20,17)-(20,19)
(20,17)-(20,23)
(21,16)-(21,26)
(21,18)-(21,24)
(21,22)-(21,24)
*)

(* type error slice
(19,5)-(21,77)
(19,11)-(19,29)
(19,13)-(19,29)
(19,18)-(19,19)
(19,18)-(19,23)
(19,18)-(19,29)
(19,28)-(19,29)
(20,5)-(21,77)
(20,17)-(20,19)
(20,17)-(20,23)
(20,21)-(20,23)
(21,5)-(21,77)
(21,16)-(21,26)
(21,18)-(21,20)
(21,18)-(21,24)
(21,22)-(21,24)
(21,44)-(21,58)
(21,44)-(21,70)
(21,59)-(21,60)
(21,61)-(21,65)
(21,66)-(21,70)
*)
