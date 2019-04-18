
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
(c , d :: t)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* type error slice
(8,4)-(11,18)
(8,11)-(11,16)
(8,13)-(11,16)
(9,3)-(11,16)
(10,5)-(10,56)
(10,20)-(10,23)
(10,29)-(10,35)
(10,29)-(10,56)
(10,36)-(10,37)
(10,46)-(10,56)
(10,47)-(10,48)
(10,52)-(10,55)
(11,3)-(11,9)
(11,3)-(11,16)
(11,10)-(11,11)
(13,4)-(16,80)
(13,13)-(16,78)
(13,16)-(16,78)
(14,3)-(16,78)
(15,9)-(15,73)
(15,10)-(15,21)
(15,22)-(15,69)
(15,23)-(15,28)
(15,29)-(15,30)
(15,70)-(15,72)
(16,8)-(16,78)
(16,9)-(16,11)
(22,3)-(27,35)
(22,12)-(26,52)
(23,5)-(26,52)
(23,11)-(23,45)
(23,13)-(23,45)
(23,17)-(23,45)
(23,23)-(23,24)
(23,44)-(23,45)
(25,5)-(26,52)
(25,16)-(25,49)
(25,22)-(25,24)
(25,40)-(25,49)
(25,41)-(25,48)
(25,42)-(25,43)
(26,5)-(26,52)
(26,19)-(26,33)
(26,19)-(26,45)
(26,34)-(26,35)
(26,41)-(26,45)
(27,14)-(27,35)
(27,15)-(27,18)
(27,19)-(27,34)
(27,20)-(27,27)
*)
