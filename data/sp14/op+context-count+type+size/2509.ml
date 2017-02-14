
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
    let f a x =
      let (o,p) = a in
      let (d1,d2) = x in
      ((((d1 + d2) + o) / 10), ((((d1 + d2) + o) mod 10) :: p)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add ((padZero 0) :: (l1 0) :: l2));;


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
    let f a x =
      let (o,p) = a in
      let (d1,d2) = x in
      ((((d1 + d2) + o) / 10), ((((d1 + d2) + o) mod 10) :: p)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(28,41)-(28,43)
(30,18)-(30,47)
(30,19)-(30,30)
(30,28)-(30,29)
(30,34)-(30,40)
(30,34)-(30,46)
(30,38)-(30,39)
*)

(* type error slice
(13,3)-(16,79)
(13,12)-(16,77)
(15,50)-(15,66)
(15,51)-(15,62)
(15,63)-(15,65)
(22,2)-(30,48)
(22,11)-(29,51)
(30,13)-(30,48)
(30,14)-(30,17)
(30,18)-(30,47)
(30,19)-(30,30)
(30,20)-(30,27)
(30,28)-(30,29)
*)
