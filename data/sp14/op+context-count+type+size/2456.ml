
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
(2,7)-(2,12)
(2,11)-(2,12)
(4,11)-(7,16)
(5,3)-(7,16)
(18,3)-(22,56)
(19,5)-(21,77)
(19,17)-(19,18)
(19,17)-(19,22)
(20,5)-(21,77)
(20,16)-(20,19)
(20,17)-(20,18)
(21,5)-(21,77)
(21,16)-(21,26)
(21,18)-(21,20)
(21,22)-(21,24)
(21,30)-(21,77)
(21,44)-(21,70)
(22,4)-(22,44)
(22,4)-(22,56)
(22,16)-(22,19)
(22,21)-(22,28)
(22,21)-(22,34)
(22,29)-(22,31)
(22,32)-(22,34)
(22,37)-(22,38)
(22,39)-(22,40)
(22,41)-(22,42)
(22,43)-(22,44)
(22,49)-(22,50)
(22,49)-(22,56)
(22,51)-(22,52)
(22,53)-(22,54)
(22,55)-(22,56)
*)

(* type error slice
(15,38)-(15,78)
(15,38)-(15,78)
(15,52)-(15,62)
(15,52)-(15,65)
(15,71)-(15,78)
(19,5)-(21,77)
(19,11)-(19,22)
(19,17)-(19,18)
(19,17)-(19,22)
(20,5)-(21,77)
(20,16)-(20,19)
(21,44)-(21,58)
(21,44)-(21,70)
(21,59)-(21,60)
(21,61)-(21,65)
(22,4)-(22,14)
(22,4)-(22,44)
(22,49)-(22,50)
(22,49)-(22,56)
*)
