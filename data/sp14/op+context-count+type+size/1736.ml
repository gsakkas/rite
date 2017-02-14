
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
    let f a x = let y = l2 in let (one,two) = a in ((x :: one), (y :: two)) in
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
      let y = List.hd l2 in let (one,two) = a in ((x :: one), (y :: two)) in
    let base = ([], []) in
    let args = l1 in let (bar,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,17)-(19,74)
(19,25)-(19,27)
(19,31)-(19,74)
(20,5)-(21,71)
(21,5)-(21,71)
(21,22)-(21,71)
*)

(* type error slice
(6,4)-(12,39)
(6,13)-(12,35)
(6,16)-(12,35)
(7,3)-(12,35)
(8,3)-(12,35)
(9,3)-(12,35)
(10,3)-(12,35)
(11,11)-(11,45)
(11,43)-(11,45)
(12,15)-(12,35)
(12,31)-(12,32)
(12,33)-(12,35)
(15,3)-(15,75)
(15,3)-(15,75)
(15,40)-(15,41)
(15,40)-(15,45)
(15,40)-(15,45)
(15,44)-(15,45)
(15,51)-(15,61)
(15,51)-(15,63)
(15,62)-(15,63)
(18,3)-(22,33)
(18,12)-(21,71)
(19,5)-(21,71)
(19,5)-(21,71)
(19,11)-(19,74)
(19,17)-(19,74)
(19,25)-(19,27)
(19,31)-(19,74)
(19,47)-(19,48)
(19,66)-(19,67)
(19,66)-(19,74)
(19,66)-(19,74)
(19,71)-(19,74)
(20,5)-(21,71)
(21,5)-(21,71)
(21,22)-(21,71)
(21,22)-(21,71)
(21,38)-(21,52)
(21,38)-(21,64)
(21,53)-(21,54)
(21,68)-(21,71)
(22,3)-(22,13)
(22,3)-(22,33)
(22,15)-(22,18)
(22,15)-(22,33)
(22,20)-(22,27)
(22,20)-(22,33)
*)
