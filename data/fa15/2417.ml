
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
    let f a x = ((x [0]) + (x [1])) :: a in
    let base = [] in
    let args = List.combine (l1, l2) in
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
      let (l1x,l2x) = x in let (a1,a2) = a in (a1, ((l1x + l2x) :: a2)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,16)-(19,35)
(19,16)-(19,40)
(19,17)-(19,24)
(19,18)-(19,19)
(19,20)-(19,23)
(19,21)-(19,22)
(19,27)-(19,34)
(19,30)-(19,33)
(19,31)-(19,32)
(20,4)-(22,51)
(20,15)-(20,17)
(21,4)-(22,51)
(21,15)-(21,27)
(21,28)-(21,36)
*)

(* type error slice
(19,4)-(22,51)
(19,10)-(19,40)
(19,16)-(19,40)
(19,39)-(19,40)
(21,15)-(21,27)
(21,15)-(21,36)
(21,28)-(21,36)
(22,4)-(22,51)
(22,18)-(22,32)
(22,18)-(22,44)
(22,33)-(22,34)
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
(17,11)-(23,34)
(17,14)-(23,34)
(18,2)-(23,34)
(18,11)-(22,51)
(19,4)-(22,51)
(19,10)-(19,40)
(19,12)-(19,40)
(19,16)-(19,40)
(19,16)-(19,35)
(19,17)-(19,24)
(19,18)-(19,19)
(19,20)-(19,23)
(19,21)-(19,22)
(19,27)-(19,34)
(19,28)-(19,29)
(19,30)-(19,33)
(19,31)-(19,32)
(19,39)-(19,40)
(20,4)-(22,51)
(20,15)-(20,17)
(21,4)-(22,51)
(21,15)-(21,36)
(21,15)-(21,27)
(21,28)-(21,36)
(21,29)-(21,31)
(21,33)-(21,35)
(22,4)-(22,51)
(22,18)-(22,44)
(22,18)-(22,32)
(22,33)-(22,34)
(22,35)-(22,39)
(22,40)-(22,44)
(22,48)-(22,51)
(23,2)-(23,34)
(23,2)-(23,12)
(23,13)-(23,34)
(23,14)-(23,17)
(23,18)-(23,33)
(23,19)-(23,26)
(23,27)-(23,29)
(23,30)-(23,32)
*)
