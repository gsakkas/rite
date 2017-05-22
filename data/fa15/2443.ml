
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x = y
  then (l1, l2)
  else
    if x < y
    then (((clone 0 (y - x)) @ l1), l2)
    else (l1, ((clone 0 (x - y)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (l1x,l2x) = x in
      let (a1,a2) = a in let sum = l1x + l2x in (0, ((sum mod 10) :: a2)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x = y
  then (l1, l2)
  else
    if x < y
    then (((clone 0 (y - x)) @ l1), l2)
    else (l1, ((clone 0 (x - y)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (l1x,l2x) = x in
      let (a1,a2) = a in
      let sum = l1x + l2x in ((0 :: a2), ((sum mod 10) :: a2)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(21,49)-(21,50)
(21,52)-(21,72)
*)

(* type error slice
(19,4)-(24,51)
(19,10)-(21,73)
(19,12)-(21,73)
(20,6)-(21,73)
(21,6)-(21,73)
(21,25)-(21,73)
(21,48)-(21,73)
(21,49)-(21,50)
(22,4)-(24,51)
(22,15)-(22,23)
(22,16)-(22,18)
(24,18)-(24,32)
(24,18)-(24,44)
(24,33)-(24,34)
(24,35)-(24,39)
*)

(* all spans
(2,14)-(2,64)
(2,16)-(2,64)
(2,20)-(2,64)
(2,23)-(2,28)
(2,23)-(2,24)
(2,27)-(2,28)
(2,34)-(2,56)
(2,34)-(2,35)
(2,39)-(2,56)
(2,40)-(2,45)
(2,46)-(2,47)
(2,48)-(2,55)
(2,49)-(2,50)
(2,53)-(2,54)
(2,62)-(2,64)
(4,12)-(12,39)
(4,15)-(12,39)
(5,2)-(12,39)
(5,10)-(5,24)
(5,10)-(5,21)
(5,22)-(5,24)
(6,2)-(12,39)
(6,10)-(6,24)
(6,10)-(6,21)
(6,22)-(6,24)
(7,2)-(12,39)
(7,5)-(7,10)
(7,5)-(7,6)
(7,9)-(7,10)
(8,7)-(8,15)
(8,8)-(8,10)
(8,12)-(8,14)
(10,4)-(12,39)
(10,7)-(10,12)
(10,7)-(10,8)
(10,11)-(10,12)
(11,9)-(11,39)
(11,10)-(11,34)
(11,29)-(11,30)
(11,11)-(11,28)
(11,12)-(11,17)
(11,18)-(11,19)
(11,20)-(11,27)
(11,21)-(11,22)
(11,25)-(11,26)
(11,31)-(11,33)
(11,36)-(11,38)
(12,9)-(12,39)
(12,10)-(12,12)
(12,14)-(12,38)
(12,33)-(12,34)
(12,15)-(12,32)
(12,16)-(12,21)
(12,22)-(12,23)
(12,24)-(12,31)
(12,25)-(12,26)
(12,29)-(12,30)
(12,35)-(12,37)
(14,19)-(15,69)
(15,2)-(15,69)
(15,8)-(15,9)
(15,23)-(15,25)
(15,36)-(15,69)
(15,39)-(15,44)
(15,39)-(15,40)
(15,43)-(15,44)
(15,50)-(15,62)
(15,50)-(15,60)
(15,61)-(15,62)
(15,68)-(15,69)
(17,11)-(25,34)
(17,14)-(25,34)
(18,2)-(25,34)
(18,11)-(24,51)
(19,4)-(24,51)
(19,10)-(21,73)
(19,12)-(21,73)
(20,6)-(21,73)
(20,22)-(20,23)
(21,6)-(21,73)
(21,20)-(21,21)
(21,25)-(21,73)
(21,35)-(21,44)
(21,35)-(21,38)
(21,41)-(21,44)
(21,48)-(21,73)
(21,49)-(21,50)
(21,52)-(21,72)
(21,53)-(21,65)
(21,54)-(21,57)
(21,62)-(21,64)
(21,69)-(21,71)
(22,4)-(24,51)
(22,15)-(22,23)
(22,16)-(22,18)
(22,20)-(22,22)
(23,4)-(24,51)
(23,15)-(23,44)
(23,15)-(23,23)
(23,24)-(23,44)
(23,25)-(23,37)
(23,38)-(23,40)
(23,41)-(23,43)
(24,4)-(24,51)
(24,18)-(24,44)
(24,18)-(24,32)
(24,33)-(24,34)
(24,35)-(24,39)
(24,40)-(24,44)
(24,48)-(24,51)
(25,2)-(25,34)
(25,2)-(25,12)
(25,13)-(25,34)
(25,14)-(25,17)
(25,18)-(25,33)
(25,19)-(25,26)
(25,27)-(25,29)
(25,30)-(25,32)
*)
