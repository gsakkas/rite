
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
(19,17)-(19,62)
(19,25)-(19,27)
(19,31)-(19,62)
(19,39)-(19,41)
(20,5)-(21,71)
(21,5)-(21,71)
(21,22)-(21,71)
(22,20)-(22,27)
(22,28)-(22,30)
(22,31)-(22,33)
*)

(* type error slice
(6,4)-(12,39)
(6,13)-(12,35)
(6,16)-(12,35)
(7,3)-(12,35)
(8,3)-(12,35)
(9,3)-(12,35)
(10,3)-(12,35)
(11,11)-(11,40)
(11,11)-(11,45)
(11,36)-(11,37)
(18,3)-(22,33)
(18,12)-(21,71)
(19,17)-(19,62)
(19,25)-(19,27)
(19,47)-(19,48)
(19,47)-(19,52)
(21,5)-(21,71)
(21,16)-(21,18)
(21,38)-(21,52)
(21,38)-(21,64)
(21,60)-(21,64)
(22,15)-(22,18)
(22,15)-(22,33)
(22,20)-(22,27)
(22,20)-(22,33)
*)
