
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
(28,42)-(28,44)
0 :: l2
AppG (fromList [VarG,LitG])

(30,19)-(30,48)
padZero l1 l2
AppG (fromList [VarG])

*)

(* type error slice
(13,4)-(16,80)
(13,13)-(16,78)
(15,51)-(15,67)
(15,52)-(15,63)
(15,64)-(15,66)
(22,3)-(30,49)
(22,12)-(29,52)
(30,14)-(30,49)
(30,15)-(30,18)
(30,19)-(30,48)
(30,20)-(30,31)
(30,21)-(30,28)
(30,29)-(30,30)
*)
