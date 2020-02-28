
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
(23,29)-(23,51)
List.rev (0 :: l1)
AppG [AppG [EmptyG,EmptyG]]

(23,52)-(23,72)
List.rev (0 :: l2)
AppG [AppG [EmptyG,EmptyG]]

*)

(* type error slice
(2,44)-(2,45)
(2,44)-(2,66)
(2,49)-(2,66)
(2,50)-(2,55)
(2,56)-(2,57)
(4,4)-(12,20)
(4,13)-(12,18)
(4,16)-(12,18)
(5,3)-(12,18)
(6,3)-(12,18)
(7,3)-(12,18)
(8,22)-(8,45)
(8,23)-(8,28)
(8,29)-(8,30)
(10,5)-(12,18)
(11,15)-(11,55)
(11,16)-(11,27)
(11,28)-(11,51)
(11,29)-(11,34)
(11,52)-(11,54)
(12,10)-(12,18)
(12,15)-(12,17)
(18,3)-(25,35)
(18,12)-(24,52)
(19,5)-(24,52)
(19,11)-(21,77)
(19,13)-(21,77)
(20,7)-(21,77)
(20,19)-(20,20)
(21,27)-(21,34)
(21,28)-(21,29)
(23,5)-(24,52)
(23,16)-(23,28)
(23,16)-(23,72)
(23,29)-(23,51)
(23,30)-(23,44)
(23,31)-(23,39)
(23,52)-(23,72)
(23,53)-(23,65)
(23,54)-(23,62)
(23,63)-(23,64)
(23,69)-(23,71)
(24,19)-(24,33)
(24,19)-(24,45)
(24,34)-(24,35)
(24,41)-(24,45)
(25,14)-(25,35)
(25,15)-(25,18)
(25,19)-(25,34)
(25,20)-(25,27)
*)
