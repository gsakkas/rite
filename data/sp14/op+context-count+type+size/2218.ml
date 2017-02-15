
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
(25,20)-(25,30)
(25,21)-(25,29)
(25,22)-(25,24)
(25,26)-(25,28)
(26,4)-(26,51)
(26,18)-(26,44)
*)

(* type error slice
(19,2)-(19,77)
(19,2)-(19,77)
(19,40)-(19,41)
(19,40)-(19,45)
(19,40)-(19,45)
(19,44)-(19,45)
(19,51)-(19,61)
(19,51)-(19,64)
(19,62)-(19,64)
(22,2)-(27,34)
(22,11)-(26,51)
(23,4)-(26,51)
(23,4)-(26,51)
(23,10)-(23,17)
(23,12)-(23,17)
(23,16)-(23,17)
(24,4)-(26,51)
(25,4)-(26,51)
(25,4)-(26,51)
(25,15)-(25,32)
(25,15)-(25,32)
(25,16)-(25,31)
(25,20)-(25,30)
(25,20)-(25,30)
(25,21)-(25,29)
(26,4)-(26,51)
(26,4)-(26,51)
(26,18)-(26,32)
(26,18)-(26,44)
(26,33)-(26,34)
(26,40)-(26,44)
(26,48)-(26,51)
(27,2)-(27,12)
(27,2)-(27,34)
(27,13)-(27,34)
(27,14)-(27,17)
*)
