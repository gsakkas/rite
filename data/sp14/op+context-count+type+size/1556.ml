
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
    let base = [] in
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
(19,16)-(19,23)
(19,16)-(19,28)
(19,21)-(19,22)
(19,27)-(19,28)
(20,15)-(20,17)
(21,4)-(21,76)
(21,15)-(21,25)
(21,16)-(21,24)
(21,21)-(21,23)
(21,29)-(21,76)
*)

(* type error slice
(19,4)-(21,76)
(19,10)-(19,28)
(19,12)-(19,28)
(19,16)-(19,23)
(19,17)-(19,18)
(21,4)-(21,76)
(21,15)-(21,25)
(21,15)-(21,25)
(21,16)-(21,24)
(21,43)-(21,57)
(21,43)-(21,69)
(21,58)-(21,59)
(21,65)-(21,69)
*)
