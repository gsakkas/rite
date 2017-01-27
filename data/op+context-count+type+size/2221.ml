
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
(23,31)-(23,50)
(23,40)-(23,43)
(23,54)-(23,71)
(23,63)-(23,64)
*)

(* type error slice
(2,50)-(2,55)
(2,50)-(2,64)
(2,56)-(2,57)
(2,59)-(2,64)
(4,4)-(12,20)
(4,13)-(12,17)
(4,16)-(12,17)
(5,3)-(12,17)
(5,15)-(5,26)
(5,15)-(5,29)
(5,27)-(5,29)
(6,3)-(12,17)
(6,13)-(6,24)
(6,13)-(6,27)
(6,25)-(6,27)
(7,3)-(12,17)
(8,10)-(8,21)
(8,10)-(8,48)
(8,10)-(8,53)
(8,23)-(8,28)
(8,23)-(8,43)
(8,29)-(8,30)
(8,32)-(8,43)
(8,46)-(8,48)
(8,51)-(8,53)
(18,3)-(25,33)
(18,12)-(24,52)
(19,5)-(24,52)
(19,11)-(21,75)
(19,13)-(21,75)
(20,7)-(21,75)
(20,19)-(20,20)
(21,7)-(21,75)
(21,19)-(21,20)
(21,28)-(21,44)
(21,28)-(21,75)
(21,51)-(21,75)
(22,5)-(24,52)
(22,17)-(22,18)
(22,17)-(22,22)
(22,20)-(22,22)
(23,5)-(24,52)
(23,16)-(23,28)
(23,16)-(23,71)
(23,31)-(23,39)
(23,31)-(23,43)
(23,31)-(23,50)
(23,40)-(23,43)
(23,41)-(23,42)
(23,48)-(23,50)
(23,54)-(23,62)
(23,54)-(23,64)
(23,54)-(23,71)
(23,63)-(23,64)
(23,69)-(23,71)
(24,5)-(24,52)
(24,19)-(24,33)
(24,19)-(24,45)
(24,34)-(24,35)
(24,36)-(24,40)
(24,41)-(24,45)
(24,49)-(24,52)
(25,15)-(25,18)
(25,15)-(25,33)
(25,20)-(25,27)
(25,20)-(25,33)
(25,28)-(25,30)
(25,31)-(25,33)
*)
