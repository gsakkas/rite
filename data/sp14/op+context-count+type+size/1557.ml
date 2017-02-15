
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
    let f a x = (x * x) + a in
    let base = 0 in
    let args = l1 in let (_,res) = List.fold_left f base args in res in
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
(19,16)-(19,23)
(19,16)-(19,27)
(19,21)-(19,22)
(19,26)-(19,27)
(20,15)-(20,16)
(21,4)-(21,68)
(22,14)-(22,17)
(22,18)-(22,33)
(22,19)-(22,26)
(22,27)-(22,29)
(22,30)-(22,32)
*)

(* type error slice
(19,4)-(21,68)
(19,10)-(19,27)
(19,16)-(19,27)
(19,26)-(19,27)
(21,21)-(21,68)
(21,35)-(21,49)
(21,35)-(21,61)
(21,50)-(21,51)
*)
