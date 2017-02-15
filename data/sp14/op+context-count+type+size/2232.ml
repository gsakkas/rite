
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
    let f a x = match x with | (c,d::t) -> (c, d) in
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
(23,47)-(23,48)
(24,4)-(26,51)
*)

(* type error slice
(13,3)-(16,79)
(13,12)-(16,77)
(13,15)-(16,77)
(14,2)-(16,77)
(15,7)-(15,77)
(15,8)-(15,72)
(15,9)-(15,20)
(15,21)-(15,68)
(15,22)-(15,27)
(15,74)-(15,76)
(16,12)-(16,76)
(16,13)-(16,24)
(16,25)-(16,72)
(16,26)-(16,31)
(16,73)-(16,75)
(22,2)-(27,34)
(22,11)-(26,51)
(23,4)-(26,51)
(23,10)-(23,49)
(23,12)-(23,49)
(23,16)-(23,49)
(23,16)-(23,49)
(23,16)-(23,49)
(23,22)-(23,23)
(23,43)-(23,49)
(23,44)-(23,45)
(23,47)-(23,48)
(24,4)-(26,51)
(24,15)-(24,22)
(24,16)-(24,17)
(24,19)-(24,21)
(25,4)-(26,51)
(25,15)-(25,48)
(25,15)-(25,48)
(25,15)-(25,48)
(25,21)-(25,23)
(25,39)-(25,48)
(25,39)-(25,48)
(25,40)-(25,47)
(25,41)-(25,42)
(25,44)-(25,46)
(26,18)-(26,32)
(26,18)-(26,44)
(26,33)-(26,34)
(26,35)-(26,39)
(26,40)-(26,44)
(27,13)-(27,34)
(27,14)-(27,17)
(27,18)-(27,33)
(27,19)-(27,26)
*)
