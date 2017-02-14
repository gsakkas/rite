
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
(23,44)-(23,45)
(24,5)-(26,52)
(27,20)-(27,27)
(27,28)-(27,30)
(27,31)-(27,33)
*)

(* type error slice
(8,4)-(11,18)
(8,11)-(11,16)
(8,13)-(11,16)
(9,3)-(11,16)
(10,5)-(10,55)
(10,5)-(10,55)
(10,20)-(10,23)
(10,29)-(10,35)
(10,29)-(10,55)
(10,36)-(10,37)
(10,47)-(10,48)
(10,47)-(10,55)
(10,47)-(10,55)
(10,52)-(10,55)
(11,3)-(11,9)
(11,3)-(11,16)
(11,10)-(11,11)
(13,4)-(16,80)
(13,13)-(16,76)
(13,16)-(16,76)
(14,3)-(16,76)
(15,10)-(15,21)
(15,10)-(15,72)
(15,10)-(15,77)
(15,23)-(15,28)
(15,23)-(15,66)
(15,29)-(15,30)
(22,3)-(27,33)
(22,12)-(26,52)
(23,5)-(26,52)
(23,11)-(23,45)
(23,13)-(23,45)
(23,17)-(23,45)
(23,17)-(23,45)
(23,23)-(23,24)
(23,44)-(23,45)
(25,5)-(26,52)
(25,16)-(25,49)
(25,16)-(25,49)
(25,16)-(25,49)
(25,22)-(25,24)
(25,40)-(25,49)
(25,40)-(25,49)
(25,42)-(25,43)
(25,42)-(25,47)
(26,5)-(26,52)
(26,19)-(26,33)
(26,19)-(26,45)
(26,34)-(26,35)
(26,41)-(26,45)
(27,15)-(27,18)
(27,15)-(27,33)
(27,20)-(27,27)
(27,20)-(27,33)
*)
