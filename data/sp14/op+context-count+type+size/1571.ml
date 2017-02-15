
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
(19,16)-(19,75)
(19,24)-(19,26)
(19,30)-(19,75)
(20,4)-(21,70)
(21,4)-(21,70)
(21,21)-(21,70)
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
(11,42)-(11,44)
(12,12)-(12,35)
(12,30)-(12,31)
(12,32)-(12,34)
(15,2)-(15,74)
(15,2)-(15,74)
(15,39)-(15,40)
(15,39)-(15,44)
(15,39)-(15,44)
(15,43)-(15,44)
(15,50)-(15,60)
(15,50)-(15,62)
(15,61)-(15,62)
(18,2)-(22,34)
(18,11)-(21,70)
(19,4)-(21,70)
(19,4)-(21,70)
(19,10)-(19,75)
(19,16)-(19,75)
(19,24)-(19,26)
(19,30)-(19,75)
(19,46)-(19,47)
(19,64)-(19,74)
(19,64)-(19,74)
(19,65)-(19,66)
(19,70)-(19,73)
(20,4)-(21,70)
(21,4)-(21,70)
(21,21)-(21,70)
(21,21)-(21,70)
(21,37)-(21,51)
(21,37)-(21,63)
(21,52)-(21,53)
(21,67)-(21,70)
(22,2)-(22,12)
(22,2)-(22,34)
(22,13)-(22,34)
(22,14)-(22,17)
(22,18)-(22,33)
(22,19)-(22,26)
*)
