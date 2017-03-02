
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  if difference2 > 0
  then (((clone 0 difference2) @ l1), l2)
  else
    if difference1 > 0 then (l1, ((clone 0 difference1) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> if h = 0 then removeZero t else h :: (removeZero t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a + x in
    let base = (0, 0) in
    let args = (l1, l2) in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  if difference2 > 0
  then (((clone 0 difference2) @ l1), l2)
  else
    if difference1 > 0 then (l1, ((clone 0 difference1) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> if h = 0 then removeZero t else h :: (removeZero t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,temp) = a in
      let s = (x1 + x2) + carry in
      let carry' = s / 10 in
      let rem = s mod 10 in
      let acc = rem :: temp in
      if (List.length acc) = (List.length l1)
      then (0, (carry' :: acc))
      else (carry', acc) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,16)-(19,17)
(19,16)-(19,21)
(20,4)-(21,74)
(20,15)-(20,21)
(20,19)-(20,20)
(21,4)-(21,74)
(21,15)-(21,23)
(21,16)-(21,18)
(21,27)-(21,74)
*)

(* type error slice
(19,4)-(21,74)
(19,10)-(19,21)
(19,16)-(19,17)
(19,16)-(19,21)
(20,4)-(21,74)
(20,15)-(20,21)
(21,41)-(21,55)
(21,41)-(21,67)
(21,56)-(21,57)
(21,58)-(21,62)
*)

(* all spans
(2,14)-(2,64)
(2,16)-(2,64)
(2,20)-(2,64)
(2,23)-(2,28)
(2,23)-(2,24)
(2,27)-(2,28)
(2,34)-(2,36)
(2,42)-(2,64)
(2,42)-(2,43)
(2,47)-(2,64)
(2,48)-(2,53)
(2,54)-(2,55)
(2,56)-(2,63)
(2,57)-(2,58)
(2,61)-(2,62)
(4,12)-(10,76)
(4,15)-(10,76)
(5,2)-(10,76)
(5,20)-(5,55)
(5,20)-(5,36)
(5,21)-(5,32)
(5,33)-(5,35)
(5,39)-(5,55)
(5,40)-(5,51)
(5,52)-(5,54)
(6,2)-(10,76)
(6,20)-(6,55)
(6,20)-(6,36)
(6,21)-(6,32)
(6,33)-(6,35)
(6,39)-(6,55)
(6,40)-(6,51)
(6,52)-(6,54)
(7,2)-(10,76)
(7,5)-(7,20)
(7,5)-(7,16)
(7,19)-(7,20)
(8,7)-(8,41)
(8,8)-(8,36)
(8,31)-(8,32)
(8,9)-(8,30)
(8,10)-(8,15)
(8,16)-(8,17)
(8,18)-(8,29)
(8,33)-(8,35)
(8,38)-(8,40)
(10,4)-(10,76)
(10,7)-(10,22)
(10,7)-(10,18)
(10,21)-(10,22)
(10,28)-(10,62)
(10,29)-(10,31)
(10,33)-(10,61)
(10,56)-(10,57)
(10,34)-(10,55)
(10,35)-(10,40)
(10,41)-(10,42)
(10,43)-(10,54)
(10,58)-(10,60)
(10,68)-(10,76)
(10,69)-(10,71)
(10,73)-(10,75)
(12,19)-(15,63)
(13,2)-(15,63)
(13,8)-(13,9)
(14,10)-(14,12)
(15,12)-(15,63)
(15,15)-(15,20)
(15,15)-(15,16)
(15,19)-(15,20)
(15,26)-(15,38)
(15,26)-(15,36)
(15,37)-(15,38)
(15,44)-(15,63)
(15,44)-(15,45)
(15,49)-(15,63)
(15,50)-(15,60)
(15,61)-(15,62)
(17,11)-(22,34)
(17,14)-(22,34)
(18,2)-(22,34)
(18,11)-(21,74)
(19,4)-(21,74)
(19,10)-(19,21)
(19,12)-(19,21)
(19,16)-(19,21)
(19,16)-(19,17)
(19,20)-(19,21)
(20,4)-(21,74)
(20,15)-(20,21)
(20,16)-(20,17)
(20,19)-(20,20)
(21,4)-(21,74)
(21,15)-(21,23)
(21,16)-(21,18)
(21,20)-(21,22)
(21,27)-(21,74)
(21,41)-(21,67)
(21,41)-(21,55)
(21,56)-(21,57)
(21,58)-(21,62)
(21,63)-(21,67)
(21,71)-(21,74)
(22,2)-(22,34)
(22,2)-(22,12)
(22,13)-(22,34)
(22,14)-(22,17)
(22,18)-(22,33)
(22,19)-(22,26)
(22,27)-(22,29)
(22,30)-(22,32)
*)
