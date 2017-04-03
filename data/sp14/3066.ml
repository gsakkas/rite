
let x x = x;;

let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else x :: xs;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a + x in
    let base = [1] in
    let args = [(l1, l2)] in let (_,res) = List.fold_left f base args in res in
  (removeZero (add (padZero l1 l2)) 0 0 9 9) + (1 0 0 2);;


(* fix

let l1 = [0; 0; 9; 9];;

let l2 = [1; 0; 0; 2];;

let x = (3, 3) :: (List.rev (List.combine l1 l2));;

let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else x :: xs;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = x in
    let base = (0, []) in
    let args = [(0, [])] in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(2,6)-(2,11)
(2,10)-(2,11)
(4,10)-(7,15)
(19,16)-(19,17)
(19,16)-(19,21)
(20,15)-(20,18)
(20,16)-(20,17)
(21,4)-(21,76)
(21,17)-(21,19)
(21,21)-(21,23)
(21,29)-(21,76)
(22,2)-(22,44)
(22,2)-(22,56)
(22,36)-(22,37)
(22,38)-(22,39)
(22,40)-(22,41)
(22,42)-(22,43)
(22,47)-(22,56)
(22,48)-(22,49)
(22,50)-(22,51)
(22,52)-(22,53)
(22,54)-(22,55)
*)

(* type error slice
(15,37)-(15,77)
(15,37)-(15,77)
(15,51)-(15,61)
(15,51)-(15,64)
(15,70)-(15,77)
(19,4)-(21,76)
(19,10)-(19,21)
(19,16)-(19,17)
(19,16)-(19,21)
(20,4)-(21,76)
(20,15)-(20,18)
(21,43)-(21,57)
(21,43)-(21,69)
(21,58)-(21,59)
(21,60)-(21,64)
(22,2)-(22,44)
(22,3)-(22,13)
(22,47)-(22,56)
(22,48)-(22,49)
*)

(* all spans
(2,6)-(2,11)
(2,10)-(2,11)
(4,10)-(7,15)
(4,12)-(7,15)
(5,2)-(7,15)
(5,17)-(6,55)
(5,19)-(6,55)
(5,21)-(6,55)
(6,4)-(6,55)
(6,7)-(6,13)
(6,7)-(6,8)
(6,12)-(6,13)
(6,19)-(6,22)
(6,28)-(6,55)
(6,28)-(6,34)
(6,35)-(6,36)
(6,37)-(6,44)
(6,38)-(6,39)
(6,42)-(6,43)
(6,45)-(6,55)
(6,46)-(6,47)
(6,51)-(6,54)
(7,2)-(7,15)
(7,2)-(7,8)
(7,9)-(7,10)
(7,11)-(7,12)
(7,13)-(7,15)
(9,12)-(12,77)
(9,15)-(12,77)
(10,2)-(12,77)
(10,5)-(10,40)
(10,5)-(10,21)
(10,6)-(10,17)
(10,18)-(10,20)
(10,24)-(10,40)
(10,25)-(10,36)
(10,37)-(10,39)
(11,7)-(11,77)
(11,8)-(11,72)
(11,9)-(11,20)
(11,21)-(11,68)
(11,22)-(11,27)
(11,28)-(11,29)
(11,30)-(11,67)
(11,31)-(11,47)
(11,32)-(11,43)
(11,44)-(11,46)
(11,50)-(11,66)
(11,51)-(11,62)
(11,63)-(11,65)
(11,69)-(11,71)
(11,74)-(11,76)
(12,7)-(12,77)
(12,8)-(12,10)
(12,12)-(12,76)
(12,13)-(12,24)
(12,25)-(12,72)
(12,26)-(12,31)
(12,32)-(12,33)
(12,34)-(12,71)
(12,35)-(12,51)
(12,36)-(12,47)
(12,48)-(12,50)
(12,54)-(12,70)
(12,55)-(12,66)
(12,67)-(12,69)
(12,73)-(12,75)
(14,19)-(15,77)
(15,2)-(15,77)
(15,8)-(15,9)
(15,23)-(15,25)
(15,37)-(15,77)
(15,40)-(15,45)
(15,40)-(15,41)
(15,44)-(15,45)
(15,51)-(15,64)
(15,51)-(15,61)
(15,62)-(15,64)
(15,70)-(15,77)
(15,70)-(15,71)
(15,75)-(15,77)
(17,11)-(22,56)
(17,14)-(22,56)
(18,2)-(22,56)
(18,11)-(21,76)
(19,4)-(21,76)
(19,10)-(19,21)
(19,12)-(19,21)
(19,16)-(19,21)
(19,16)-(19,17)
(19,20)-(19,21)
(20,4)-(21,76)
(20,15)-(20,18)
(20,16)-(20,17)
(21,4)-(21,76)
(21,15)-(21,25)
(21,16)-(21,24)
(21,17)-(21,19)
(21,21)-(21,23)
(21,29)-(21,76)
(21,43)-(21,69)
(21,43)-(21,57)
(21,58)-(21,59)
(21,60)-(21,64)
(21,65)-(21,69)
(21,73)-(21,76)
(22,2)-(22,56)
(22,2)-(22,44)
(22,3)-(22,13)
(22,14)-(22,35)
(22,15)-(22,18)
(22,19)-(22,34)
(22,20)-(22,27)
(22,28)-(22,30)
(22,31)-(22,33)
(22,36)-(22,37)
(22,38)-(22,39)
(22,40)-(22,41)
(22,42)-(22,43)
(22,47)-(22,56)
(22,48)-(22,49)
(22,50)-(22,51)
(22,52)-(22,53)
(22,54)-(22,55)
*)
