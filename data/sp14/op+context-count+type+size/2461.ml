
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

let x x = x;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a + x in
    let base = [x] in
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
(2,10)-(5,15)
(3,2)-(5,15)
(15,6)-(15,11)
(15,10)-(15,11)
(18,2)-(22,56)
(19,4)-(21,76)
(19,16)-(19,17)
(19,16)-(19,21)
(20,4)-(21,76)
(20,15)-(20,18)
(20,16)-(20,17)
(21,4)-(21,76)
(21,15)-(21,25)
(21,17)-(21,19)
(21,21)-(21,23)
(21,29)-(21,76)
(21,43)-(21,69)
(22,2)-(22,44)
(22,2)-(22,56)
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

(* type error slice
(13,37)-(13,77)
(13,37)-(13,77)
(13,51)-(13,61)
(13,51)-(13,64)
(13,70)-(13,77)
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
