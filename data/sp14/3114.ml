
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
    let args = [(0, [(l1, l2)])] in
    let (_,res) = List.fold_left f base args in res in
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
    let f a x = x in
    let base = (0, []) in
    let args = [(0, [])] in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(25,21)-(25,31)
[]
ListG []

*)

(* type error slice
(19,3)-(19,78)
(19,41)-(19,42)
(19,41)-(19,46)
(19,45)-(19,46)
(19,52)-(19,62)
(19,52)-(19,65)
(19,63)-(19,65)
(22,3)-(27,35)
(22,12)-(26,52)
(23,5)-(26,52)
(23,11)-(23,18)
(23,13)-(23,18)
(23,17)-(23,18)
(24,5)-(26,52)
(25,5)-(26,52)
(25,16)-(25,33)
(25,17)-(25,32)
(25,21)-(25,31)
(25,22)-(25,30)
(26,5)-(26,52)
(26,19)-(26,33)
(26,19)-(26,45)
(26,34)-(26,35)
(26,41)-(26,45)
(26,49)-(26,52)
(27,3)-(27,13)
(27,3)-(27,35)
(27,14)-(27,35)
(27,15)-(27,18)
*)
