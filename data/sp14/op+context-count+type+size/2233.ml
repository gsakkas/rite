
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let first = List.length l1 in
  let sec = List.length l2 in
  if first < sec
  then ((List.append (clone 0 (sec - first)) l1), l2)
  else
    if first > sec
    then (l1, (List.append (clone 0 (first - sec)) l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (i,j) = x in
      let (s,t) = a in ((((i + j) + s) / 10), ((((i + j) + s) mod 10) :: t)) in
    let base = (0, []) in
    let args = List.combine ((List.rev [0]) :: l1) ((List.rev 0) :: l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let first = List.length l1 in
  let sec = List.length l2 in
  if first < sec
  then ((List.append (clone 0 (sec - first)) l1), l2)
  else
    if first > sec
    then (l1, (List.append (clone 0 (first - sec)) l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (i,j) = x in
      let (s,t) = a in ((((i + j) + s) / 10), ((((i + j) + s) mod 10) :: t)) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,28)-(23,50)
(23,39)-(23,42)
(23,51)-(23,71)
(23,62)-(23,63)
*)

(* type error slice
(2,43)-(2,44)
(2,43)-(2,65)
(2,43)-(2,65)
(2,48)-(2,65)
(2,49)-(2,54)
(2,55)-(2,56)
(4,3)-(12,19)
(4,12)-(12,17)
(4,15)-(12,17)
(5,2)-(12,17)
(6,2)-(12,17)
(7,2)-(12,17)
(8,7)-(8,53)
(8,21)-(8,44)
(8,22)-(8,27)
(8,28)-(8,29)
(8,50)-(8,52)
(11,14)-(11,54)
(11,15)-(11,26)
(11,27)-(11,50)
(11,28)-(11,33)
(11,51)-(11,53)
(18,2)-(25,34)
(18,11)-(24,51)
(19,4)-(24,51)
(19,10)-(21,76)
(19,12)-(21,76)
(20,6)-(21,76)
(20,18)-(20,19)
(21,26)-(21,33)
(21,27)-(21,28)
(23,4)-(24,51)
(23,15)-(23,27)
(23,15)-(23,71)
(23,28)-(23,50)
(23,28)-(23,50)
(23,29)-(23,43)
(23,30)-(23,38)
(23,51)-(23,71)
(23,51)-(23,71)
(23,52)-(23,64)
(23,53)-(23,61)
(23,62)-(23,63)
(23,68)-(23,70)
(24,18)-(24,32)
(24,18)-(24,44)
(24,33)-(24,34)
(24,40)-(24,44)
(25,13)-(25,34)
(25,14)-(25,17)
(25,18)-(25,33)
(25,19)-(25,26)
*)
