
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
    let base = (0, [l1]) in
    let args = [(3, [])] in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


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
    let f a x = a in
    let base = (0, []) in
    let args = [(3, [])] in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,17)-(23,18)
(24,20)-(24,24)
(24,21)-(24,23)
*)

(* type error slice
(13,4)-(16,80)
(13,13)-(16,76)
(13,16)-(16,76)
(14,3)-(16,76)
(15,10)-(15,21)
(15,10)-(15,72)
(15,10)-(15,77)
(19,3)-(19,78)
(19,3)-(19,78)
(19,41)-(19,42)
(19,41)-(19,46)
(19,41)-(19,46)
(19,45)-(19,46)
(19,52)-(19,62)
(19,52)-(19,65)
(19,63)-(19,65)
(22,3)-(26,33)
(22,12)-(25,76)
(23,5)-(25,76)
(24,5)-(25,76)
(24,5)-(25,76)
(24,17)-(24,24)
(24,20)-(24,24)
(24,20)-(24,24)
(24,21)-(24,23)
(25,5)-(25,76)
(25,29)-(25,76)
(25,29)-(25,76)
(25,43)-(25,57)
(25,43)-(25,69)
(25,60)-(25,64)
(25,73)-(25,76)
(26,3)-(26,13)
(26,3)-(26,33)
(26,15)-(26,18)
(26,15)-(26,33)
(26,20)-(26,27)
(26,20)-(26,33)
*)
