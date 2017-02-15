
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
    let f a x = ([(List.hd x) + 1], [(List.hd x) + 2]) in
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
    let f a x = ([x + 1], [x + 2]) in
    let base = ([], []) in
    let args = l1 in let (bar,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,18)-(19,29)
(19,19)-(19,26)
(19,37)-(19,48)
(19,38)-(19,45)
(22,19)-(22,26)
*)

(* type error slice
(2,3)-(4,17)
(2,14)-(4,15)
(2,16)-(4,15)
(3,2)-(4,15)
(3,27)-(3,77)
(3,27)-(3,77)
(3,41)-(3,47)
(3,41)-(3,68)
(3,48)-(3,49)
(3,58)-(3,68)
(3,58)-(3,68)
(3,59)-(3,60)
(3,64)-(3,67)
(3,74)-(3,77)
(4,2)-(4,8)
(4,2)-(4,15)
(4,9)-(4,10)
(6,3)-(12,38)
(6,12)-(12,36)
(6,15)-(12,36)
(7,2)-(12,36)
(8,2)-(12,36)
(9,2)-(12,36)
(10,2)-(12,36)
(11,7)-(11,45)
(11,8)-(11,40)
(11,9)-(11,34)
(11,10)-(11,15)
(11,16)-(11,17)
(11,35)-(11,36)
(18,2)-(22,34)
(18,11)-(21,70)
(19,4)-(21,70)
(19,10)-(19,54)
(19,12)-(19,54)
(19,18)-(19,29)
(19,19)-(19,26)
(19,27)-(19,28)
(21,4)-(21,70)
(21,15)-(21,17)
(21,37)-(21,51)
(21,37)-(21,63)
(21,52)-(21,53)
(21,59)-(21,63)
(22,13)-(22,34)
(22,14)-(22,17)
(22,18)-(22,33)
(22,19)-(22,26)
*)
