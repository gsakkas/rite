
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
    let f a x = let a = l1 in let b = l2 in ([a + 1], [a + 2]) in
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
    let f a x =
      let a = List.hd l1 in let b = List.hd l2 in ([a + 1], [a + 2]) in
    let base = ([], []) in
    let args = l1 in let (bar,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,16)-(19,62)
(19,24)-(19,26)
(19,30)-(19,62)
(19,38)-(19,40)
(20,4)-(21,70)
(21,4)-(21,70)
(21,21)-(21,70)
(22,19)-(22,26)
(22,27)-(22,29)
(22,30)-(22,32)
*)

(* type error slice
(6,3)-(12,38)
(6,12)-(12,36)
(6,15)-(12,36)
(7,2)-(12,36)
(8,2)-(12,36)
(9,2)-(12,36)
(10,2)-(12,36)
(11,7)-(11,45)
(11,8)-(11,40)
(11,35)-(11,36)
(18,2)-(22,34)
(18,11)-(21,70)
(19,16)-(19,62)
(19,24)-(19,26)
(19,46)-(19,47)
(19,46)-(19,51)
(21,4)-(21,70)
(21,15)-(21,17)
(21,37)-(21,51)
(21,37)-(21,63)
(21,59)-(21,63)
(22,13)-(22,34)
(22,14)-(22,17)
(22,18)-(22,33)
(22,19)-(22,26)
*)
