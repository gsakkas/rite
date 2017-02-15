
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
(23,16)-(23,17)
(24,19)-(24,23)
(24,20)-(24,22)
*)

(* type error slice
(13,3)-(16,79)
(13,12)-(16,77)
(13,15)-(16,77)
(14,2)-(16,77)
(15,7)-(15,77)
(15,8)-(15,72)
(15,9)-(15,20)
(19,2)-(19,77)
(19,2)-(19,77)
(19,40)-(19,41)
(19,40)-(19,45)
(19,40)-(19,45)
(19,44)-(19,45)
(19,51)-(19,61)
(19,51)-(19,64)
(19,62)-(19,64)
(22,2)-(26,34)
(22,11)-(25,75)
(23,4)-(25,75)
(24,4)-(25,75)
(24,4)-(25,75)
(24,15)-(24,24)
(24,19)-(24,23)
(24,19)-(24,23)
(24,20)-(24,22)
(25,4)-(25,75)
(25,28)-(25,75)
(25,28)-(25,75)
(25,42)-(25,56)
(25,42)-(25,68)
(25,59)-(25,63)
(25,72)-(25,75)
(26,2)-(26,12)
(26,2)-(26,34)
(26,13)-(26,34)
(26,14)-(26,17)
(26,18)-(26,33)
(26,19)-(26,26)
*)
