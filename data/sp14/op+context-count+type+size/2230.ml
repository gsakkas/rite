
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
    let f a x = match x with | (c,d::t) -> c in
    let base = (0, []) in
    let args = match l1 with | h::t -> [(h, l2)] in
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
    let f a x = match x with | (c,d::t) -> (c, (d :: t)) in
    let base = (0, []) in
    let args = match l1 with | h::t -> [(h, l2)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,43)-(23,44)
(24,4)-(26,51)
(27,19)-(27,26)
(27,27)-(27,29)
(27,30)-(27,32)
*)

(* type error slice
(8,3)-(11,17)
(8,10)-(11,15)
(8,12)-(11,15)
(9,2)-(11,15)
(10,4)-(10,55)
(10,4)-(10,55)
(10,19)-(10,22)
(10,28)-(10,34)
(10,28)-(10,55)
(10,35)-(10,36)
(10,45)-(10,55)
(10,45)-(10,55)
(10,46)-(10,47)
(10,51)-(10,54)
(11,2)-(11,8)
(11,2)-(11,15)
(11,9)-(11,10)
(13,3)-(16,79)
(13,12)-(16,77)
(13,15)-(16,77)
(14,2)-(16,77)
(15,7)-(15,77)
(15,8)-(15,72)
(15,9)-(15,20)
(15,21)-(15,68)
(15,22)-(15,27)
(15,28)-(15,29)
(22,2)-(27,34)
(22,11)-(26,51)
(23,4)-(26,51)
(23,10)-(23,44)
(23,12)-(23,44)
(23,16)-(23,44)
(23,16)-(23,44)
(23,22)-(23,23)
(23,43)-(23,44)
(25,4)-(26,51)
(25,15)-(25,48)
(25,15)-(25,48)
(25,15)-(25,48)
(25,21)-(25,23)
(25,39)-(25,48)
(25,39)-(25,48)
(25,40)-(25,47)
(25,41)-(25,42)
(26,4)-(26,51)
(26,18)-(26,32)
(26,18)-(26,44)
(26,33)-(26,34)
(26,40)-(26,44)
(27,13)-(27,34)
(27,14)-(27,17)
(27,18)-(27,33)
(27,19)-(27,26)
*)
