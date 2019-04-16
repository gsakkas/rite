
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
    let args = match l1 with | h::t -> [(h, (List.rev l2))] in
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
    let f a x = match x with | (c,d::t) -> (c, t) in
    let base = (0, []) in
    let args = match l1 with | h::t -> [(h, (List.rev l2))] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,48)-(23,49)
t
VarG

*)

(* type error slice
(13,4)-(16,80)
(13,13)-(16,78)
(13,16)-(16,78)
(14,3)-(16,78)
(15,9)-(15,73)
(15,10)-(15,21)
(15,22)-(15,69)
(15,23)-(15,28)
(15,70)-(15,72)
(16,8)-(16,78)
(16,9)-(16,11)
(16,13)-(16,77)
(16,14)-(16,25)
(16,26)-(16,73)
(16,27)-(16,32)
(22,3)-(27,35)
(22,12)-(26,52)
(23,5)-(26,52)
(23,11)-(23,50)
(23,13)-(23,50)
(23,17)-(23,50)
(23,23)-(23,24)
(23,44)-(23,50)
(23,45)-(23,46)
(23,48)-(23,49)
(24,5)-(26,52)
(24,16)-(24,23)
(24,17)-(24,18)
(24,20)-(24,22)
(25,5)-(26,52)
(25,16)-(25,60)
(25,22)-(25,24)
(25,40)-(25,60)
(25,41)-(25,59)
(25,42)-(25,43)
(25,45)-(25,58)
(25,46)-(25,54)
(25,55)-(25,57)
(26,19)-(26,33)
(26,19)-(26,45)
(26,34)-(26,35)
(26,36)-(26,40)
(26,41)-(26,45)
(27,14)-(27,35)
(27,15)-(27,18)
(27,19)-(27,34)
(27,20)-(27,27)
*)
