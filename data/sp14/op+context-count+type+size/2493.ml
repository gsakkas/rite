
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
    let f a x = match x with | (h1,h2)::t -> (h1 + h2) @ a in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
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
    let f a x =
      match x with
      | (d1,d2) ->
          ((d1 + d2), ((d1 + d2) :: ((match a with | (a1,a2) -> a2)))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,17)-(23,59)
(23,47)-(23,49)
(23,47)-(23,59)
(23,52)-(23,54)
(23,56)-(23,57)
(23,58)-(23,59)
(24,5)-(26,52)
(24,17)-(24,22)
(25,5)-(26,52)
(26,5)-(26,52)
(27,20)-(27,27)
(27,28)-(27,30)
(27,31)-(27,33)
*)

(* type error slice
(23,5)-(26,52)
(23,11)-(23,59)
(23,13)-(23,59)
(23,17)-(23,59)
(23,17)-(23,59)
(23,23)-(23,24)
(23,47)-(23,54)
(23,47)-(23,59)
(23,56)-(23,57)
(25,5)-(26,52)
(25,16)-(25,24)
(25,16)-(25,44)
(25,26)-(25,38)
(25,26)-(25,44)
(26,19)-(26,33)
(26,19)-(26,45)
(26,34)-(26,35)
(26,41)-(26,45)
*)
